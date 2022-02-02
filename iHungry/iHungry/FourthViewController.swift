//
//  FourthViewController.swift
//  iHungry
//
//  Created by Anya Westby on 2/1/22.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func gotofood(_ sender: UIButton) {
        if(UIApplication.shared.canOpenURL(URL(string: "doordash://")!)){
            UIApplication.shared.open(URL(string: "doordash://")!, options: [:], completionHandler: nil)
        } else {
            if(UIApplication.shared.canOpenURL(URL(string: "ubereats://")!)){
                UIApplication.shared.open(URL(string: "ubereats://")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "https://www.doordash.com")!, options: [:], completionHandler: nil)
            }
        }
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
