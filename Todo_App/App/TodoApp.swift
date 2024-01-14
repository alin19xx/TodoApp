//
//  TodoApp.swift
//  TodoApp
//
//  Created by Alex Lin Segarra on 7/1/24.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
    }
}
