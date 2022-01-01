//
//  FeaturedView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/26/21.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured View")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex){
                ForEach (0..<model.recipe.count) { r in
                    
                    if model.recipe[r].featured == true {
                        
                        Button(action: {
                            //sjow the serapy detale sheat
                            self.isDetailViewShowing = true
                        }) {
                            // recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(model.recipe[r].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipe[r].name)
                                        .padding(5)
                                }
                            }
                        }
                        .tag(r)
                        .sheet(isPresented: $isDetailViewShowing) {
                            //show the recipe detail view
                            RecipeDetailView(recipe: model.recipe[r])
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(radius: 10, x: -5, y: 5)
                    }
                    
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preperatin Time:")
                    .font(.headline)
                Text(model.recipe[tabSelectionIndex].prepTime)
                Text("Highlights:")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipe[tabSelectionIndex].highlights)
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
        var index = model.recipe.firstIndex { (recipe) -> Bool in
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
