//
//  RecipeTabView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/26/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            //featured view to be added lator
            Text("Featured View")  // place holder
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured ")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
