//
//  AnimalDataHandler.swift
//  Lab5
//
//  Created by Anya Westby on 2/28/22.
//

import Foundation


class AnimalDataHandler{
    var animalData = AnimalData()
    
    func loadjson() async {
        let urlPath = "https://zoo-animal-api.herokuapp.com/animals/rand/8"
        guard let url = URL(string: urlPath)
        else{
            print ("url error")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else{
                print ("file download error")
                return
            }
            print ("download complete")
            print(data)
            parsejson(data)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func parsejson(_ data: Data){
        do{
            let apiData = try JSONDecoder().decode([Animal].self, from: data)
            for animal in apiData{
                animalData.animals.append(animal)
                print (animal)
            }
            print (animalData.animals.count)
            //print(apiData.name)
            print("parsejson done")
        }
        catch let jsonErr {
            print(jsonErr.localizedDescription)
            return
        }
    }
    
    func getAnimals() -> [Animal]{
        return animalData.animals
    }
}
