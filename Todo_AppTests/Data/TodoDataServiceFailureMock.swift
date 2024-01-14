//
//  MockCombineDataService.swift
//  Todo_AppTests
//
//  Created by Alex Lin Segarra on 12/1/24.
//

import Combine
import FirebaseFirestore
@testable import Todo_App

//class TodoDataServiceFailureMock: CombineDataService {
//    typealias Item = Todo
//
//    func getData() -> AnyPublisher<[Todo], Error> {
//        Fail(error: FirebaseDataServiceError.customError("Fetch data failed"))
//            .eraseToAnyPublisher()
//    }
//
//    func add(_ item: Todo) -> AnyPublisher<Void, Error> {
//        Fail(error: FirebaseDataServiceError.addDocumentFailed(nil))
//            .eraseToAnyPublisher()
//    }
//    
//    func update(_ item: Todo) -> AnyPublisher<Void, Error> {
//        Fail(error: FirebaseDataServiceError.updateDocumentFailed(nil))
//            .eraseToAnyPublisher()
//    }
//    
//    func delete(_ item: Todo) -> AnyPublisher<Void, Error> {
//        Fail(error: FirebaseDataServiceError.deleteDocumentFailed(nil))
//            .eraseToAnyPublisher()
//    }
//}

