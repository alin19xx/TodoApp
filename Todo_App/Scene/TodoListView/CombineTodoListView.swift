//
//  CombineTodoListView.swift
//  Todo_App
//
//  Created by Alex Lin Segarra on 10/1/24.
//

import Foundation
import Combine

struct TodoListModelError: Identifiable {
    let id = UUID()
    let message: String
}

class CombineTodoListViewModel<DS: CombineDataService> : ObservableObject where DS.Item == Todo {
    
    @Published private(set) var todos: [Todo] = []
    @Published var modelError: TodoListModelError?
    
    private let ds: DS
    private var cancellables = Set<AnyCancellable>()
    
    init(ds: DS = CombineFirebaseDataService(path: "todoList")) {
        self.ds = ds
        
        fetchData()
    }
    
    func fetchData() {
        performAction(ds.getData(), successHandler: { [weak self] todos in
            self?.todos = todos
        })
    }
    
    func addItem(todo: Todo) {
        performAction(ds.add(todo))
    }
    
    func updateItem(todo: Todo) {
        performAction(ds.update(todo))
    }
    
    func deleteItem(indexSet: IndexSet) {
        let todosToDelete = indexSet.compactMap { index in
            self.todos.indices.contains(index) ? self.todos[index] : nil
        }

        todosToDelete.forEach { todo in
            performAction(ds.delete(todo), successHandler: { [weak self] _ in
                guard let self = self else { return }
                if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
                    self.todos.remove(at: index)
                }
            })
        }
    }
    
    
    // MARK: - Private Methods
    
    private func performAction<T>(_ publisher: AnyPublisher<T, Error>,
                                  successHandler: ((T) -> Void)? = nil,
                                  failureHandler: ((Error) -> Void)? = nil) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    guard let self else { return }
                    
                    let errorMessage = self.firebaseErrorMessage(from: error)
                    self.modelError = TodoListModelError(message: errorMessage)
                    
                    failureHandler?(error)
                case .finished: break
                }
            } receiveValue: { value in
                successHandler?(value)
            }
            .store(in: &cancellables)
    }

    private func firebaseErrorMessage(from error: Error) -> String {
        if let firebaseError = error as? FirebaseDataServiceError {
            switch firebaseError {
            case .documentIDMissing:
                return "The document does not have a valid ID."
            case .addDocumentFailed(_):
                return "Error adding the document."
            case .deleteDocumentFailed(_):
                return "Error deleting the document."
            case .updateDocumentFailed(_):
                return "Error updating the document."
            case .customError(let message):
                if let actualMessage = message {
                    return actualMessage
                } else {
                    return "Custom error without a specific message."
                }
            }
        } else {
            return error.localizedDescription
        }
    }
}
