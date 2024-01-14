//
//  ContentView.swift
//  Todo_App
//
//  Created by Alex Lin Segarra on 7/1/24.
//

import SwiftUI
import Combine
import FirebaseFirestoreSwift
import Charts

struct TodoListView: View {
    
    @StateObject var combineVM = CombineTodoListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(combineVM.todos) { todo in
                    TodoRowView(todo: todo, save: { todo in
                        combineVM.updateItem(todo: todo)
                    })
                }
                .onDelete(perform: combineVM.deleteItem(indexSet:))
            }
            .navigationTitle("Todos")
            .toolbar {
                Button {
                    combineVM.addItem(todo: Todo())
                } label: {
                    Text("Add")
                }
            }
        }
        .alert(item: $combineVM.modelError) { error in
            Alert(title: Text("Error"),
                  message: Text(error.message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    TodoListView()
}
