//
//  RecipeLoader.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import Foundation

class RecipeLoader{
    
    var allData = [RecipeList]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([RecipeList].self, from: data)
            }
            catch{
                print("Cannot load data")
            }
        }
    }
    
    func getRecipeURL() -> [String]{
        var recipes = [String]()
        for recipe in allData{
            recipes.append(recipe.url)
        }
        return recipes
    }
}
