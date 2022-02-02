//
//  ViewController.swift
//  iHungry
//
//  Created by Anya Westby on 2/1/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return number of components
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return num of rows in data
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //Returns title for the given row
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Outputs string to label to show what food the user selected
        foodChoiceLabel.text = "You enjoy \(category[row]) food."
    }
    
    @IBOutlet weak var foodPicker: UIPickerView!
    
    @IBOutlet weak var foodChoiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let category = ["New American", "Indian", "Mexican", "Italian", "Thai", "Japanese", "Chinese"]


}

