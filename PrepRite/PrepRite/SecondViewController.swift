//
//  SecondViewController.swift
//  PrepRite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit


class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var proteinPickerView: UIPickerView!
    @IBOutlet weak var proteinChoiceLabel: UILabel!
    
    let vc = ViewController()
    
    var passedPro: ((String?) -> Void)?
    var pro: String = ""
    var meal: String = ""
    
    @IBAction func didPressButton(_ sender: Any) {
        
        passedPro?(pro)
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "third") as! ThirdViewController
        vc2.modalPresentationStyle = .fullScreen
        present(vc2, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vc.passedMeal = { text in
            self.meal = text
        }
    }
    
    let protein = ["Chicken", "Seafood", "Tofu", "Beef", "Eggs"]
    
    //methods to implement meal picker
    //UIPickerViewDataSource required method
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //UIPickerViewDataSource required method
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return protein.count //returns number of rows
    }
    
    //UIPickerViewDelegate method
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return protein[row]
    }
    
    //UIPickerViewDelegate method – called when row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        proteinChoiceLabel.text = "\(protein[row])" //updates bottom label
        pro = protein[row]
    }
}
