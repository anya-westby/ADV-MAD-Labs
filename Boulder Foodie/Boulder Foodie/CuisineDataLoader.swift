//
//  CuisineDataLoader.swift
//  Boulder Foodie
//
//  Created by Anya Westby on 2/9/22.
//

import Foundation

class CuisineDataLoader{
    var myData = [CuisineData]()
    
    let datafilename = "data.plist"
    
    func getDataFile(datafile: String) -> URL{
        let dPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dPath[0]
        print(docDir)
        
        return docDir.appendingPathComponent(datafile)
    }
    
    func writeData(){
        let dataFileURL = getDataFile(datafile: datafilename)
        print (dataFileURL)
        
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        do{
            let data = try plistEncoder.encode(myData.self)
            try data.write(to: dataFileURL)
        } catch {
            print(error)
        }
    }
    
    func loadMyData(filename: String){
        let pathURL: URL?
        let dataFileURL = getDataFile(datafile: datafilename)
        print(dataFileURL)
        
        if FileManager.default.fileExists(atPath: dataFileURL.path){
            pathURL = dataFileURL
        }
        else{
            pathURL = Bundle.main.url(forResource: filename, withExtension: "plist")}
            
        let plistDecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL!)
                myData = try plistDecoder.decode([CuisineData].self, from: data)
            } catch{
                print(error)
            }
        }
    
    func getCuisines() -> [String]{
        var cuisines = [String]()
        for item in myData{
            cuisines.append(item.cuisine)
        }
        return cuisines
    }
    
    func getRestaurants(index: Int) -> [String] {
        return myData[index].restaurants
    }
    
    func addRestaurant(index: Int, newRestaurant:String, newIndex: Int){
        myData[index].restaurants.insert(newRestaurant, at: newIndex)
    }
    
    func removeRestaurant(index: Int, restaurantIndex: Int){
        myData[index].restaurants.remove(at: restaurantIndex)
    }
}
