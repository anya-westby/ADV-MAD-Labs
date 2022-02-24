//
//  FourthViewController.swift
//  PrepRite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit
import LinkPresentation

protocol FourthViewControllerDelegate: NSObjectProtocol{
    func getMeal(meal: String)
    func getPro(pro: String)
    func getVeg(veg: String)
}

class FourthViewController: UIViewController {
    
    weak var delegate : FourthViewControllerDelegate?
    
    @IBOutlet var linkView: LPLinkView!
    @IBOutlet weak var labelRecipe: UILabel!
    
    var meal: String = ""
    var pro: String = ""
    var veg: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func prepareRecipes(){
        if (meal == "Healthy"){
            if (pro == "Chicken"){
                if (veg == "Zucchini"){
                    let url = URL(string: "https://www.cookingclassy.com/healthy-lemon-parmesan-chicken-and-veggies-cooking-classy/")!
                    let metadataProvider = LPMetadataProvider()
                    metadataProvider.startFetchingMetadata(for: url) { [self] metadata, error in
                        if error != nil {
                            // The fetch failed; handle the error.
                            // Examples: server doesn't respond, is too slow, user doesn't have network.
                            return
                            
                        }
                        // Make use of the fetched metadata.
                        let linkView = LPLinkView(metadata: metadata!)
                        labelRecipe.addSubview(linkView)
                        linkView.sizeToFit()
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
