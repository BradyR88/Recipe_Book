//
//  FeaturedView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/26/21.
//

import SwiftUI

struct FeaturedView: View {
    
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], predicate: NSPredicate(format: "featured == true")) var recipes: FetchedResults<Recipe>
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured View")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex){
                    ForEach (0..<recipes.count) { r in
                        
                        Button(action: {
                            //sjow the serapy detale sheat
                            self.isDetailViewShowing = true
                        }) {
                            // recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    let image = UIImage(data: recipes[r].image ?? Data()) ?? UIImage()
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(recipes[r].name)
                                        .padding(5)
                                }
                            }
                        }
                        .tag(r)
                        .sheet(isPresented: $isDetailViewShowing) {
                            //show the recipe detail view
                            RecipeDetailView(recipe: recipes[r])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(radius: 10, x: -5, y: 5)
                        
                        
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preperatin Time:")
                    .font(.headline)
                Text(recipes[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: recipes[tabSelectionIndex].highlights)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .onAppear {
            setFeaturedIndex()
        }
        
    }
    
    func setFeaturedIndex() {
        //find the index of the first recipe that is fearured
        var index = recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(RecipeModel())
    }
}
