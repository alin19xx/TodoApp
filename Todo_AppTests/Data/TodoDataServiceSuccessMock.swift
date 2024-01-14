//
//  TodoDataServiceSuccessMock.swift
//  Todo_AppTests
//
//  Created by Alex Lin Segarra on 13/1/24.
//

import Combine
import FirebaseFirestore
@testable import Todo_App

//class TodoDataServiceSuccessMock: CombineDataService {
//    typealias Item = Todo
//    
//    private var defaultTodos: [Todo] = [
//        Todo(text: "Todo 1", isDone: false),
//        Todo(text: "Todo 2", isDone: false),
//        Todo(text: "Todo 3", isDone: false)
//    ]
//    
//    var addItemResult: Result<Void, Error> = .success(())
//    var updateItemResult: Result<Void, Error> = .success(())
//    var deleteItemResult: Result<Void, Error> = .success(())
//    
//    func getData() -> AnyPublisher<[Todo], Error> {
//        Just(defaultTodos)
//            .setFailureType(to: Error.self)
//            .eraseToAnyPublisher()
//    }
//    
//    func add(_ item: Todo) -> AnyPublisher<Void, Error> {
//        performOperation(result: addItemResult) {
//            self.defaultTodos.append(item)
//        }
//    }
//    
//    func update(_ item: Todo) -> AnyPublisher<Void, Error> {
//        performOperation(result: updateItemResult) {
//            if let index = self.defaultTodos.firstIndex(where: { $0.id == item.id }) {
//                self.defaultTodos[index] = item
//            } else {
//                // Handle the case where the item doesn't exist
//                // This can be a no-op or throw an error
//            }
//        }
//    }
//    
//    func delete(_ item: Todo) -> AnyPublisher<Void, Error> {
//        performOperation(result: deleteItemResult) {
//            self.defaultTodos.removeAll(where: { $0.id == item.id })
//        }
//    }
//    
//    private func performOperation<T>(result: Result<T, Error>, operation: @escaping () -> Void) -> AnyPublisher<T, Error> {
//        Future<T, Error> { promise in
//            switch result {
//            case .success(let value):
//                operation()
//                promise(.success(value))
//            case .failure(let error):
//                promise(.failure(error))
//            }
//        }
//        .eraseToAnyPublisher()
//    }
//}
