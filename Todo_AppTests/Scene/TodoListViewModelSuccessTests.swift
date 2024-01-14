//
//  TodoListViewModelSuccessTests.swift
//  Todo_AppTests
//
//  Created by Alex Lin Segarra on 12/1/24.
//

import XCTest
import Combine
@testable import Todo_App

//class TodoListViewModelSuccessTests: XCTestCase {
//    
//    var viewModel: CombineTodoListViewModel = CombineTodoListViewModel(ds: TodoDataServiceSuccessMock())
//    
//    private var cancellables = Set<AnyCancellable>()
//
//    override func setUp() {
//        super.setUp()
////        
//        viewModel.fetchData()
////        print("MISCO: \(viewModel.todos)")
//    }
//
//    override func tearDown() {
//        cancellables.removeAll()
//        
//        super.tearDown()
//    }
//
//    func testAddItem() {
//        let expectation = XCTestExpectation(description: "Add item")
//        let newTodo = Todo(text: "New Todo", isDone: false)
//
//        viewModel.addItem(todo: newTodo)
//
//        // Usamos Combine para esperar la actualización de la lista de todos
//        viewModel.$todos
//            .first(where: { $0.contains(where: { $0.id == newTodo.id }) })
//            .sink(receiveValue: { _ in
//                expectation.fulfill()
//            })
//            .store(in: &cancellables)
//
//        wait(for: [expectation], timeout: 5)
//    }
//    
//    func testUpdateItem() {
//        let expectation = XCTestExpectation(description: "Update item")
//        
//        // Espera a que se carguen los datos iniciales.
//        viewModel.$todos
////            .first(where: { !$0.isEmpty })
//            .sink { [weak self] _ in
//                guard let self = self, 
//                      let todoToUpdate = self.viewModel.todos.first(where: { !$0.isDone }) else {
//                    print("MISCO: \(self?.viewModel.todos)")
//                    XCTFail("No hay todos para actualizar")
//                    return
//                }
//                
//                var updatedTodo = todoToUpdate
//                updatedTodo.isDone = true
//                
//                self.viewModel.updateItem(todo: updatedTodo)
//                
//                // Espera a que el todo se actualice.
//                self.viewModel.$todos
//                    .first(where: { $0.contains(where: { $0.id == updatedTodo.id && $0.isDone }) })
//                    .sink(receiveValue: { _ in
//                        expectation.fulfill()
//                    })
//                    .store(in: &self.cancellables)
//            }
//            .store(in: &cancellables)
//        wait(for: [expectation], timeout: 5)
//    }
//
//    func testDeleteItem() {
//        let expectation = XCTestExpectation(description: "Delete item")
//        
//        // Aseguramos que el ViewModel esté inicializado y tenga al menos un item.
//        guard let indexToDelete = viewModel.todos.firstIndex(where: { !$0.isDone }) else {
//            XCTFail("No hay todos para eliminar")
//            return
//        }
//
//        // Obtenemos el ID antes de eliminarlo para poder verificar después.
//        let todoToDeleteId = viewModel.todos[indexToDelete].id
//        
//        // Creamos un IndexSet con el index a eliminar.
//        let indexSet = IndexSet(integer: indexToDelete)
//        
//        // Realizamos la acción de eliminar.
//        viewModel.deleteItem(indexSet: indexSet)
//        
//        // Esperamos a que el array de todos cambie.
//        viewModel.$todos // Tomamos el siguiente cambio
//            .sink { todos in
//                // Verificamos que el todo con el ID ya no exista.
//                XCTAssertFalse(todos.contains { $0.id == todoToDeleteId }, "El todo debería haberse eliminado.")
//                expectation.fulfill()
//            }
//            .store(in: &cancellables)
//
//        // Esperamos que la expectativa se cumpla.
//        wait(for: [expectation], timeout: 1.0)
//    }
//}
