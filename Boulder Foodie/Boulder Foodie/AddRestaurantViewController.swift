//
//  AddRestaurantViewController.swift
//  Boulder Foodie
//
//  Created by Anya Westby on 2/9/22.
//

import UIKit

class AddRestaurantViewController: UIViewController {

    @IBOutlet weak var restaurantTextField: UITextField!
    
    var addedRestaurant = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            if restaurantTextField.text?.isEmpty == false{
                addedRestaurant = restaurantTextField.text!
            }
        }
    }
    

}
