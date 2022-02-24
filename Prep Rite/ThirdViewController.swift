//
//  ThirdViewController.swift
//  Prep Rite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var myRecipe = RecipeModel()
    
    @IBOutlet weak var veggiePicker: UIPickerView!
    
    @IBOutlet weak var veggieChoiceLabel: UILabel!
    
    let veggie = ["Zucchini", "Salad", "Asparagus", "Bok Choy", "Broccoli"]
    
    //methods to implement meal picker
    //UIPickerViewDataSource required method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //UIPickerViewDataSource required method
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return veggie.count //returns number of rows
    }
    
    //UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return veggie[row]
    }
    
    //UIPickerViewDelegate method – called when row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        veggieChoiceLabel.text = "\(veggie[row])" //updates bottom label
        myRecipe.veg = veggie[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabbar = self.tabBarController as! BaseTabBarController
        myRecipe = tabbar.myRecipe
    }
    

}
