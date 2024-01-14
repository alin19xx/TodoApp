//
//  TodoModel.swift
//  Todo_App
//
//  Created by Alex Lin Segarra on 14/1/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Todo: FBModelType {
    @DocumentID var id: String? = UUID().uuidString
    var text: String = ""
    var isDone: Bool = false
}
