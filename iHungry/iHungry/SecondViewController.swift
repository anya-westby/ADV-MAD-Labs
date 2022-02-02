//
//  SecondViewController.swift
//  iHungry
//
//  Created by Anya Westby on 2/1/22.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return category.count
        } else {
            return type.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return category[row]
        } else {
            return type[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //gets food category
        let categoryRow = pickerView.selectedRow(inComponent: 0)
        //gets food type
        let typeRow = pickerView.selectedRow(inComponent: 1)
        
        foodChoiceLabel.text = "You enjoy \(category[categoryRow]) style \(type[typeRow])."
    }
    
    let category = ["New American", "Indian", "Mexican", "Italian", "Thai", "Japanese", "Chinese", "African"]
    let type = ["appetizers", "salads", "soups", "sandwiches", "entrees", "desserts", "beverages"]
    

    @IBOutlet weak var foodChoiceLabel: UILabel!
    @IBOutlet weak var foodPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
