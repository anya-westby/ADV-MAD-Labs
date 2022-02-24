//
//  ViewController.swift
//  Prep Rite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var myRecipe = RecipeModel()
    
    @IBOutlet weak var mealPicker: UIPickerView!
    @IBOutlet weak var mealChoiceLabel: UILabel!
    
    let mealType = ["Healthy", "Comfort"]
    
    //methods to implement meal picker
    //UIPickerViewDataSource required method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //UIPickerViewDataSource required method
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mealType.count //returns number of rows
    }
    
    //UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mealType[row]
    }
    
    //UIPickerViewDelegate method – called when row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mealChoiceLabel.text = "\(mealType[row])" //updates bottom label
        //meal = mealType[row]
        myRecipe.meal = mealType[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tabbar = self.tabBarController as! BaseTabBarController
        myRecipe = tabbar.myRecipe
        
    }


}

