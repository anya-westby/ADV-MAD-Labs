//
//  ThirdViewController.swift
//  Prep Right
//
//  Created by Anya Westby on 3/14/22.
//

import UIKit
import LinkPresentation

class ThirdViewController: UIViewController {
    
    
    @IBOutlet var linkView: LPLinkView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    var recipeData = RecipeLoader()
    var type = String()
    var protein = String()
    var veggie = String()
    var url = String()
    
    let filename = "recipeList"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recipeData.loadData(filename: filename)
        url = recipeData.getRecipeURL()
    }
    
    func prepareRecipes(){
        let recipe = URL(string: url)!
        let metadataProvider = LPMetadataProvider()
        metadataProvider.startFetchingMetadata(for: recipe) { [self] metadata, error in
            if error != nil {
                // The fetch failed; handle the error.
                // Examples: server doesn't respond, is too slow, user doesn't have network.
                return
            }
            // Make use of the fetched metadata.
            let linkView = LPLinkView(metadata: metadata!)
            recipeLabel.addSubview(linkView)
            linkView.sizeToFit()
                        
        }
    }
}
