//
//  ThirdViewController.swift
//  iHungry
//
//  Created by Anya Westby on 2/1/22.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == cuisineComponent{
            return cuisines.count
        } else {
            return dishes.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == cuisineComponent {
            return cuisines[row]
        } else {
            return dishes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == cuisineComponent{
            dishes = foodData.getDishes(index: row)
            dishPicker.reloadComponent(dishComponent)
            dishPicker.selectRow(0, inComponent: dishComponent, animated: true)
        }
        let cuisinerow = pickerView.selectedRow(inComponent: cuisineComponent)
        let dishrow = pickerView.selectedRow(inComponent: dishComponent)
        dishChoiceLabel.text = "You enjoy eating \(cuisines[cuisinerow]) cuisine, especially \(dishes[dishrow])"
    }

    @IBOutlet weak var dishChoiceLabel: UILabel!
    @IBOutlet weak var dishPicker: UIPickerView!
    
    var foodData = DataLoader()
    var cuisines = [String]()
    var dishes = [String]()
    let cuisineComponent = 0
    let dishComponent = 1
    let filename = "cuisineDishes"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        foodData.loadData(filename: filename)
        cuisines = foodData.getCuisine()
        dishes = foodData.getDishes(index: 0)
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
