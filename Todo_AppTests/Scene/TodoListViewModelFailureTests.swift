//
//  TodoListViewModelFailureTests.swift
//  Todo_AppTests
//
//  Created by Alex Lin Segarra on 12/1/24.
//

import XCTest
import Combine
@testable import Todo_App

//class TodoListViewModelFailureTests: XCTestCase {
//    
//    lazy var mockDataService: MockTodoDataService = {
//        return MockTodoDataService(todos: [Todo(id: "1", text: "Todo", isDone: false)], error: FirebaseDataServiceError.customError("custom"))
//    }()
//
//    lazy var viewModel: CombineTodoListViewModel<MockTodoDataService> = {
//        CombineTodoListViewModel(ds: mockDataService)
//    }()
//    
//    private var cancellables = Set<AnyCancellable>()
//
//    override func setUp() {
//        super.setUp()
//        
//    }
//
//    override func tearDown() {
//        super.tearDown()
//    }
//
//    func testFetchDataWithError() {
//        let expectation = XCTestExpectation(description: "Fetch data with error")
//        var receivedError: TodoListModelError?
//        
//        mockDataService.error = FirebaseDataServiceError.customError("Test error")
//
//        viewModel.$modelError
//            .sink { error in
//                if error != nil {
//                    receivedError = error
//                    expectation.fulfill()
//                }
//            }
//            .store(in: &cancellables)
//
//        viewModel.fetchData()
//        wait(for: [expectation], timeout: 1.0)
//
//        XCTAssertNotNil(receivedError, "Debería haber un error")
//    }
//
//
//    func testAddItemWithError() {
//        let expectation = XCTestExpectation(description: "Add item with error")
//        let newTodo = Todo(text: "New Todo", isDone: false)
//        mockDataService.error = FirebaseDataServiceError.addDocumentFailed(nil)
//        
//        viewModel.addItem(todo: newTodo)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Ajusta este tiempo según sea necesario
//            XCTAssertFalse(self.viewModel.todos.contains(where: { $0.id == newTodo.id }), "El nuevo todo no debe estar en la lista debido al error.")
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 1.5)
//    }
//
//    func testUpdateItemWithError() {
//        let expectation = XCTestExpectation(description: "Update item with error")
//
//        // Configura un error específico para la operación de actualización
//        mockDataService.error = FirebaseDataServiceError.updateDocumentFailed(nil)
//
//        // Asegúrate de que mockDataService devuelva algunos datos antes de configurar el error
//        mockDataService.todos = [Todo(id: "1", text: "Todo", isDone: false)]
//
//        // Actualiza el ViewModel para reflejar los cambios
//        viewModel.fetchData()
//
//        // Espera a que los datos se carguen
//            guard let todoToUpdate = self.viewModel.todos.first else {
//                XCTFail("No hay todos para actualizar")
//                return
//            }
//
//            var todoUpdated = todoToUpdate
//            todoUpdated.isDone = true
//            self.viewModel.updateItem(todo: todoUpdated)
//
//            self.viewModel.$modelError
//                .sink { error in
//                    if error != nil {
//                        expectation.fulfill()
//                    }
//                }
//                .store(in: &self.cancellables)
//
//            self.wait(for: [expectation], timeout: 1.0)
//            XCTAssertNotNil(self.viewModel.modelError, "Debería haber un error en el modelo")
//    }
//
//
//
//    func testDeleteItemWithError() {
//        guard let indexToDelete = mockDataService.todos.firstIndex(where: { !$0.isDone }) else {
//            XCTFail("No hay todos para eliminar")
//            return
//        }
//        
//        let indexSet = IndexSet(integer: indexToDelete)
//        viewModel.deleteItem(indexSet: indexSet)
//
//        XCTAssertFalse(viewModel.todos.contains(where: { $0.id == viewModel.todos[indexToDelete].id }), "El todo debe ser eliminado de la lista.")
//    }
//}
