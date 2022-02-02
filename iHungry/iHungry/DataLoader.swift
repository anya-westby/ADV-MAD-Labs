//
//  DataLoader.swift
//  iHungry
//
//  Created by Anya Westby on 2/1/22.
//

import Foundation

class DataLoader {
    var allData = [CuisineDishes]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension:  "plist") {
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                allData = try plistdecoder.decode([CuisineDishes].self, from: data)
            } catch {
                print("Cannot load data")
            }
        }
    }
    
    func getCuisine() -> [String]{
        var cuisines = [String]()
        for cuisine in allData {
            cuisines.append(cuisine.cuisine)
        }
        return cuisines
    }
    
    func getDishes(index: Int) -> [String] {
        return allData[index].dishes
    }
}
