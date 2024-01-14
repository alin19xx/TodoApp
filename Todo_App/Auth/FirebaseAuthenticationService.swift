//
//  FirebaseAuthenticationService.swift
//  Todo_App
//
//  Created by Alex Lin Segarra on 9/1/24.
//

import Combine
import FirebaseAuth

protocol FirebaseAuthenticationServiceProtocol {
    func register(email: String, password: String) -> AnyPublisher<User, FirebaseDataServiceError>
    func signIn(email: String, password: String) -> AnyPublisher<User, FirebaseDataServiceError>
    func signOut() -> AnyPublisher<Void, FirebaseDataServiceError>
}

class FirebaseAuthenticationService: ObservableObject, FirebaseAuthenticationServiceProtocol {
    
    @Published var user: User?
    private let authService: Auth
    
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: Auth =  Auth.auth()) {
        self.authService = authService
        
        self.authService.addStateDidChangeListener { [weak self] _, user in
            self?.user = user
        }
    }
    
    func register(email: String, password: String) -> AnyPublisher<User, FirebaseDataServiceError> {
        return Future<User, FirebaseDataServiceError> { promise in
            self.authService.createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(.customError(error.localizedDescription)))
                } else if let user = result?.user {
                    promise(.success(user))
                } else {
                    promise(.failure(.customError("Error desconocido al registrar usuario.")))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<User, FirebaseDataServiceError> {
        return Future<User, FirebaseDataServiceError> { promise in
            self.authService.signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    promise(.failure(.customError(error.localizedDescription)))
                } else if let user = result?.user {
                    promise(.success(user))
                } else {
                    promise(.failure(.customError("Error desconocido al iniciar sesión.")))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Void, FirebaseDataServiceError> {
        return Future<Void, FirebaseDataServiceError> { promise in
            do {
                try self.authService.signOut()
                promise(.success(()))
            } catch let signOutError as NSError {
                promise(.failure(.customError(signOutError.localizedDescription)))
            }
        }
        .eraseToAnyPublisher()
    }
}
