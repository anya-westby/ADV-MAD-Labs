//
//  SecondViewController.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var mealDetailPicker: UIPickerView!
    @IBOutlet weak var mealDetailOutputLabel: UILabel!
    
    let protein = ["Chicken", "Seafood", "Tofu", "Beef", "Eggs"]
    let veggie = ["Zucchini", "Salad", "Asparagus", "Bok Choy", "Broccoli"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return protein.count
        }
        else{
            return veggie.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return protein[row]
        }
        else{
            return veggie[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let proteinRow = pickerView.selectedRow(inComponent: 0)
        let veggieRow = pickerView.selectedRow(inComponent: 1)
        
        mealDetailOutputLabel.text = "You want \(protein[proteinRow]) and \(veggie[veggieRow]) in your meal."
    }

    
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
