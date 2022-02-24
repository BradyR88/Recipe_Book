//
//  recipe_bookApp.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import SwiftUI

@main
struct recipe_bookApp: App {
    var body: some Scene {
        let persistenceController = PersistenceController.shared
        
        WindowGroup {
            RecipeTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
