//
//  ContentView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    //@EnvironmentObject var model:RecipeModel
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var recipes: FetchedResults<Recipe>
    @State private var filterBy = ""
    
    private var filteredRecipes: [Recipe] {
        if filterBy.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return Array(recipes)
        }
        else {
            return recipes.filter { r in
                return r.name.contains(filterBy)
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                    .padding(.top, 40)
                
                SearchBarView(filterBy: $filterBy)
                    .padding([.horizontal,.bottom])
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(filteredRecipes) { r in
                            NavigationLink (destination: RecipeDetailView(recipe: r)) {
                                HStack(spacing: 20.0) {
                                    let image = UIImage(data: r.image ?? Data()) ?? UIImage()
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack (alignment: .leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .bold()
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.leading)
                }
            }
            .navigationBarHidden(true)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
