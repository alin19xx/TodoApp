//
//  TodoRowView.swift
//  Todo_App
//
//  Created by Alex Lin Segarra on 14/1/24.
//

import SwiftUI

struct TodoRowView: View {
    let todo: Todo
    var save: (Todo) -> ()
    @State private var model = Todo()
    
    var body: some View {
        HStack {
            Image(systemName: model.isDone ? "checkmark.circle" : "circle")
                .onTapGesture {
                    model.isDone.toggle()
                    save(model)
                }
            
            TextField("Todo", text: $model.text)
                .onSubmit(of: .text) {
                    save(model)
                }
        }
        .onAppear {
            model = todo
        }
    }
}

#Preview {
    TodoRowView(todo: Todo(text: "Test title"), save: { _ in })
}
