//
//  jsonUnpack.swift
//  recipe_book
//
//  Created by Brady Robshaw on 12/23/21.
//

import Foundation

class jsonUnpack {
    static func unpcack() -> [Recipe] {
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        if pathString != nil {
            
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    for r in recipeData {
                        r.id = UUID()
                    }
                    return recipeData
                }
                catch {
                    print(error)
                }
                
            }
            catch {
                print(error)
            }
        }
        return [Recipe]()
    }
}

