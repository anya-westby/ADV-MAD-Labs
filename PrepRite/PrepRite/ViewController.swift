//
//  ViewController.swift
//  PrepRite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    

    @IBOutlet weak var mealChoiceLabel: UILabel!
    @IBOutlet weak var mealPicker: UIPickerView!
    
    public var passedMeal: ((String?) -> Void)?
    var meal: String = ""
    
    @IBAction func didPressButton(_ sender: Any) {
        passedMeal?(meal)
        let vc = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
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
        meal = mealType[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

