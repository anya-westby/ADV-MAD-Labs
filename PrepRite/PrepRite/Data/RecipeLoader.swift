//
//  RecipeLoader.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import simd


class RecipeLoader: ObservableObject{
    
    let database = Firestore.firestore()
    var recipeInfo = [Recipe]()
    
    @Published var myRecipeInfo = [Recipe]()
    
    var myRecipe = Recipe(id: "", type: "", protein: "", veggie: "", url: "", name: "", bookmarked: false)


    func loadFirebaseData() async {
        do {
            let snapshot = try await database.collection("recipeList").getDocuments()
            self.recipeInfo = snapshot.documents.compactMap{document -> Recipe? in return try? document.data(as: Recipe.self)
            }
            print(self.recipeInfo)
        }
        catch{
            print ("There has been an error fetching the document: \(error.localizedDescription)")
        }
    }
    
   
    func showBookmarks() async{
        do{
            let recipesRef = try await database.collection("recipeList")
                .whereField("bookmarked", isEqualTo: true)
                .getDocuments()
            self.recipeInfo = recipesRef.documents.compactMap{document -> Recipe? in return try? document.data(as: Recipe.self)
            }
            print(self.recipeInfo)
        }
        catch{
            print ("There has been an error fetching the document: \(error.localizedDescription)")

        }
    }
        
        
//        let newVals = [
//            "name": self.recipeInfo.bookmarked
//        ]

//        let bookmarkedVal = Recipe.bookmarked

//
//    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) async {
//            let snapshot = database.collection("recipeList").document()
//                .parent.whereField("type", isEqualTo: selectedType)
//                .whereField("type", isEqualTo: selectedType)
//                .whereField("protein", isEqualTo: selectedPro)
//                .whereField("veggie", isEqualTo: selectedVeg)
//                .getDocuments{ (querySnapshot, err) in
//                    do{
//                        for document in querySnapshot!.documents{
//                            self.myRecipe = try document.data(as: Recipe.self)
//    //                        let lit = document as QueryDocumentSnapshot
//    //                        self.myRecipe = document.data()
//                            print("\(document.documentID) => \(document.data())")
//                        }
//                        //guard let querySnapshot = querySnapshot else {return}
//                        //self.myRecipeInfo = querySnapshot.documents.compactMap{document -> Recipe? in return try? document.data(as: Recipe.self)}
//                        //let myRecipe = try FirebaseDecoder
//                        //let myRecipe = querySnapshot.value as! [String : AnyObject]
//
//    //                    for document in querySnapshot!.documents {
//    //                        self.myRecipeInfo = querySnapshot
//    //
//    //                        //self.myRecipeInfo = document.data(as: Recipe.self)
//    //                        print("\(document.documentID) => \(document.data())")
//    //                        }
//                            //self.myRecipeInfo = document
//                            //print("\(document.documentID) => \(document.data())")
//                            //self.loadRecipes(document.documentID)
//                    } catch{
//                        print ("There has been an error fetching the document: \(error.localizedDescription)")
//                    }
//                    //print(self.myRecipeInfo)
//                }
//            }
//    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) {
//        let snapshot = database.collection("recipeList")
//            .whereField("type", isEqualTo: selectedType)
//            .whereField("protein", isEqualTo: selectedPro)
//            .whereField("veggie", isEqualTo: selectedVeg)
//
//        snapshot.getDocuments{ (querySnapshot, error) in
//            if let error = error as NSError?{
//                print ("There has been an error fetching the document: \(error.localizedDescription)")
//            }
//            else{
//                for document in querySnapshot!.documents{
//                    print("\(document.documentID) => \(document.data())")
//                    let doc = document as QueryDocumentSnapshot?
//                    let myData = doc?.data(as: Recipe.self)
//                    let id = myData?.id
//                    let url = myData?.url
//                    let type = myData?.type
//                    let protein = myData?.protein
//                    let veggie = myData?.veggie
//                    let name = myData?.name
//                    let bookmarked = myData?.bookmarked
//                    self.myRecipe = Recipe(id: id, type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//                }
//            }
//        }
//    }
    
//    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) {
//        let snapshot = database.collection("recipeList")
//            .whereField("type", isEqualTo: selectedType)
//            .whereField("protein", isEqualTo: selectedPro)
//            .whereField("veggie", isEqualTo: selectedVeg)
//
//        snapshot.getDocuments { (querySnapshot, error) in
//                if let error = error{
//                    print ("There has been an error fetching the document: \(error.localizedDescription)")
//                }
//                guard let data = querySnapshot?.data() else{
//                    print ("There has been an error fetching the document: \(error.localizedDescription)")
//                    }
//                //for document in querySnapshot!.documents{
//                //if let document = querySnapshot!.documents{
//                print("\(document.documentID) => \(document.data())")
//                //let doc = document as QueryDocumentSnapshot?
//                let doc = querySnapshot.value as! [String: AnyObject]
//                let doc = querySnapshot.document[0]
//                let myData = try doc?.data(as: Recipe.self)
//                let id = myData?.id
//                let url = myData?.url
//                let type = myData?.type
//                let protein = myData?.protein
//                let veggie = myData?.veggie
//                let name = myData?.name
//                let bookmarked = myData?.bookmarked
//                self.myRecipe = Recipe(id: id, type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//                }
//            }
    
    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) async{
        do{
            let recipe = try await database.collection("recipeList")
                .whereField("type", isEqualTo: selectedType)
                .whereField("protein", isEqualTo: selectedPro)
                .whereField("veggie", isEqualTo: selectedVeg)
                .getDocuments()
            self.recipeInfo = recipe.documents.compactMap{document -> Recipe? in return try? document.data(as: Recipe.self)
            }
            print(self.recipeInfo)
        }
        catch{
            print ("There has been an error fetching the document: \(error.localizedDescription)")

        }
    }
        
    
//    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) -> Recipe {
//        database.collection("recipeList")
//            .whereField("type", isEqualTo: selectedType)
//            .whereField("protein", isEqualTo: selectedPro)
//            .whereField("veggie", isEqualTo: selectedVeg)
//            .addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else{
//                print("No document")
//                return
//            }
//            self.myRecipeInfo = documents.map { queryDocumentSnapshot -> Recipe in
//                let data = queryDocumentSnapshot.data()
//                //let id = data["id"] as? String ?? ""
//                let url = data["url"] as? String ?? ""
//                let type = data["type"] as? String ?? ""
//                let protein = data["protein"] as? String ?? ""
//                let veggie = data["veggie"] as? String ?? ""
//                let name = data["name"] as? String ?? ""
//                let bookmarked = data["bookmakred"] as? Bool ?? false
//
//                self.myRecipe = Recipe(id: .init(), type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//
//                return Recipe(id: .init(), type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//
//            }
//        }
//        return myRecipe
//    }
//    
//    func getMyRecipe(selectedType: String, selectedPro: String, selectedVeg: String) {
//        database.collection("recipeList")
//            .whereField("type", isEqualTo: selectedType)
//            .whereField("protein", isEqualTo: selectedPro)
//            .whereField("veggie", isEqualTo: selectedVeg)
//            .getDocuments(){ (querySnapshot, err) in
//                if let err = err {
//                    print(err)
//                    return
//                }
//                guard let querySnapshot = querySnapshot else{
//                    return
//                }
//
//            }
//
//        self.myRecipeInfo = documents.map { queryDocumentSnapshot -> Recipe in
//            let data = queryDocumentSnapshot.data()
//            //let id = data["id"] as? String ?? ""
//            let url = data["url"] as? String ?? ""
//            let type = data["type"] as? String ?? ""
//            let protein = data["protein"] as? String ?? ""
//            let veggie = data["veggie"] as? String ?? ""
//            let name = data["name"] as? String ?? ""
//            let bookmarked = data["bookmakred"] as? Bool ?? false
//
//            self.myRecipe = Recipe(id: .init(), type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//
//            return Recipe(id: .init(), type: type, protein: protein, veggie: veggie, url: url, name: name, bookmarked: bookmarked)
//        }
//    }
            
       

    func loadRecipes() -> [Recipe]{
        return recipeInfo
    }
    
    func loadMyRecipe() -> [Recipe]{
        return myRecipeInfo
    }

}
