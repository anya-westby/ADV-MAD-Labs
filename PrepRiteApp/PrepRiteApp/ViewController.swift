//
//  ViewController.swift
//  PrepRiteApp
//
//  Created by Anya Westby on 2/20/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var recipePickerView: UIPickerView!
    @IBOutlet weak var outputLabel: UILabel!
    
    let protein = ["Chicken", "Seafood", "Tofu", "Beef", "Eggs"]
    let veggie = ["Zucchini", "Salad", "Asparagus", "Bok Choy", "Broccoli"]
    
    let proteinComponent = 0
    let veggieComponent = 1
    
    var selectedPro: String! = ""
    var selectedVeg: String! = ""
    
    //return two for dual component picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //returns amount of rows in each data source
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == proteinComponent {
            return protein.count
        } else {
            return veggie.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == proteinComponent {
            return protein[row]
        } else {
            return veggie[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let proteinRow = recipePickerView.selectedRow(inComponent: proteinComponent)
        let veggieRow = recipePickerView.selectedRow(inComponent: veggieComponent)
        
        outputLabel.text = "You want a meal with \(protein[proteinRow]) and \(veggie[veggieRow])"
        
        selectedPro = protein[proteinRow]
        selectedVeg = veggie[veggieRow]
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveData" {
            let vc = segue.destination as! SecondViewController

            vc.pro = selectedPro
            vc.veg = selectedVeg
        }
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        performSegue(withIdentifier: "moveData", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipePickerView.delegate = self
        recipePickerView.dataSource = self
    }


}

