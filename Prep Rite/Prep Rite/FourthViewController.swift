//
//  FourthViewController.swift
//  Prep Rite
//
//  Created by Anya Westby on 2/19/22.
//

import UIKit
import LinkPresentation


class FourthViewController: UIViewController {
    var myRecipe = RecipeModel()
    
    //let metadataProvider = LPMetadataProvider()
    var meal: String = ""
    var pro: String = ""
    var veg: String = ""
    
    
    @IBOutlet weak var linkView: LPLinkView!
    @IBOutlet weak var labelRecipe: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myRecipe = (tabBarController as! BaseTabBarController).myRecipe
        //let tabbar = tabBarController as! BaseTabBarController
        //myRecipe = tabbar.myRecipe
        meal = myRecipe.meal
        pro = myRecipe.pro
        veg = myRecipe.veg
        prepareRecipes()
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
