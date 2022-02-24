//
//  ThirdViewController.swift
//  PrepRite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  {
    
    let quad = FourthViewController()

    @IBOutlet weak var veggiePickerView: UIPickerView!
    
    @IBOutlet weak var veggieChoiceLabel: UILabel!

    
    
    @IBAction func didPressButton(_ sender: Any) {
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "fourth") as! FourthViewController
        vc3.modalPresentationStyle = .fullScreen
        present(vc3, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

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
        quad.veg = veggie[row]
    }

}
