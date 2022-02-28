//
//  AddRecipeView.swift
//  recipe_book
//
//  Created by Brady Robshaw on 2/24/22.
//

import SwiftUI

struct AddRecipeView: View {
    
    // meta data
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    // list data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredient data
    @State private var ingredient = [IngredientJSON]()
    
    // recipe Image
    @State private var recipeImage: UIImage?
    
    // image picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeHolderImage = Image("noImageAvailable")
    
    var body: some View {
        
        VStack {
            HStack {
                
                Button {
                    // clar the form
                    clear()
                } label: {
                    Text("Clear")
                }
                
                Spacer()
                
                Button {
                    // add the data to core data
                    addRecipe()
                    
                    // clar the form
                    clear()
                    
                } label: {
                    Text("Add")
                }
                
            }
            
            ScrollView (showsIndicators: false) {
                
                VStack {
                    
                    // add recipe image
                    placeHolderImage
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Button {
                            selectedImageSource = .photoLibrary
                            isShowingImagePicker = true
                        } label: {
                            Text("Photo Library")
                        }
                        Text(" | ")
                        Button {
                            selectedImageSource = .camera
                            isShowingImagePicker = true
                        } label: {
                            Text("Camera")
                        }
                        
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedSource: selectedImageSource, recipeImage: $recipeImage)
                    }
                    
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    AddListData(list: $highlights, title: "Highlights", placeHolderText: "Vegetarian")
                    AddListData(list: $directions, title: "Airections", placeHolderText: "Add the oil to the pan")
                    
                    AddIngredientData(ingredients: $ingredient)
                }
                
            }
        }
        .padding(.horizontal)
    }
    
    func loadImage() {
        
        if recipeImage != nil {
            placeHolderImage = Image(uiImage: recipeImage!)
        }
        
    }
    
    func clear() {
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredient = [IngredientJSON]()
    }
    
    func addRecipe() {
        
    }
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
