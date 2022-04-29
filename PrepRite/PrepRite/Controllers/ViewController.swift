//
//  ViewController.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import UIKit
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//import SwiftUI

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mealChoicePicker: UIPickerView!
    @IBOutlet weak var proVegPicker: UIPickerView!
    //let database = Firestore.firestore()
    //let recipeList = database.collection("recipeList")
    var recipes = [Recipe]()
    var myRecipe = Recipe(id: "", type: "", protein: "", veggie: "", url: "", name: "", bookmarked: false)
    var recipeLoader = RecipeLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getInfo()
    }
    
//    func getInfo(){
//        Task{
//            await recipeLoader.loadFirebaseData()
//            recipes = recipeLoader.loadRecipes()
//        }
//    }
//
    var selectedType: String? = nil
    var selectedPro: String? = nil
    var selectedVeg: String? = nil
    var myurl: String? = nil
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            let source = segue.source as! recipeViewController
            if source.bookmarked == true{
                
            }
        }
    }
    
//    func fetchRecipes(){
//        database.collection("recipeList").getDocuments(completion: { (querySnapshot, err) in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            } else {
//                for document in querySnapshot!.documents{
//                    let result = Result{
//                        try document.data(as: Recipe.self)
//                    }
//
//                    switch result{
//                    case .success(let recipe):
//                        //let recipe = recipe {
//                        if recipe.type == self.selectedType && recipe.protein == self.selectedPro && recipe.veggie == self.selectedVeg{
//                            self.myurl = recipe.url
//                        } else {
//                            print("document doesnt exist")
//                        }
//                    case .failure(let error):
//                        print("error decoding recipe")
//                    }
//                }
//            }
//        })
//    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let recipeVC = segue.destination as! recipeViewController
            Task{
                await recipeLoader.getMyRecipe(selectedType: selectedType!, selectedPro: selectedPro!, selectedVeg: selectedVeg!)
                let recipe = recipeLoader.loadRecipes()
                
                recipeVC.website = recipe[0].url
            }
            
            //recipeLoader.getMyRecipe(selectedType: selectedType!, selectedPro: selectedPro!, selectedVeg: selectedVeg!)
            //myRecipe = recipeLoader.loadMyRecipe()
            //let recipe = myRecipe
            //let myRecipe = recipeLoader.getMyRecipe(selectedType: selectedType!, selectedPro: selectedPro!, selectedVeg: selectedVeg!)
//            let recipeView = segue.destination as! recipeViewController
//            fetchRecipes()
//            recipeView.website = myurl
        }
    }
    
    
    
    //data for first picker view
    let choice = ["comfort", "healthy"]
    //data for second picker view
    let protein = ["chicken", "seafood", "tofu", "beef"]
    let veggie = ["zucchini", "salad", "asparagus", "bok choy", "broccoli"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == mealChoicePicker{
            return 1
        }
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == proVegPicker{
            if component == 0{
                return protein.count
            }else{
                return veggie.count
            }
        }
        return choice.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == proVegPicker{
            if component == 0{
                return protein[row]
            }else{
                return veggie[row]
            }
        }
        return choice[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == mealChoicePicker{
            selectedType = choice[row]
        }else if pickerView == proVegPicker{
            selectedPro = protein[row]
            selectedVeg = veggie[row]
        }
    }
    
}



