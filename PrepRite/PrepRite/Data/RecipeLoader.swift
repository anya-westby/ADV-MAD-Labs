//
//  RecipeLoader.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class RecipeLoader: ObservableObject{
    
    let database = Firestore.firestore()
    var recipeInfo = [RecipeList]()

    func loadData() async {
        do {
            let snapshot = try await database.collection("recipeList").getDocuments()
            self.recipeInfo = snapshot.documents.compactMap{document -> RecipeList? in return try? document.data(as: RecipeList.self)
            }
            print(self.recipeInfo)
        }
        catch{
            print ("There has been an error fetching the document: \(error.localizedDescription)")
        }
    }
 
//    func loadData(type: String, protein: String, veggie: String) async {
//        do {
//            let snapshot = try await database.collection("recipeList")
//                .whereField("type", isEqualTo: type)
//                .whereField("protein", isEqualTo: protein)
//                .whereField("veggie", isEqualTo: veggie)
//                .getDocuments()
//
//            self.recipeInfo = snapshot.documents.compactMap{document -> RecipeList? in return try? document.data(as: RecipeList.self)
//            }
//            print(self.recipeInfo)
//        }
//        catch{
//            print ("There has been an error fetching the document: \(error.localizedDescription)")
//        }
//    }
    
    
//    func loadData(type: String, protein: String, veggie: String){
//        let ref = database.collection("recipeList")
//            .whereField("type", isEqualTo: type)
//            .whereField("protein", isEqualTo: protein)
//            .whereField("veggie", isEqualTo: veggie)
//
//        ref.getDocuments { (document, error) in
//            guard error == nil else{
//                print("error", error ?? "")
//                return
//            }
//            let data = document.data()
//            if let data = data {
//                print("data", data)
//                self.recipeInfo = snapshot.documents.compactMap{document -> RecipeList? in return try? document.data(as: RecipeList.self)
//                }
//            }
//        }
//    }

    func loadRecipes() -> [RecipeList]{
        return recipeInfo
    }

}
