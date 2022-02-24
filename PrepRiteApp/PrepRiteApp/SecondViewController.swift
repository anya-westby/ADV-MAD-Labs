//
//  SecondViewController.swift
//  PrepRiteApp
//
//  Created by Anya Westby on 2/20/22.
//

import UIKit
import LinkPresentation

class SecondViewController: UIViewController {
    
    @IBOutlet var linkView: LPLinkView!
    @IBOutlet weak var labelRecipe: UILabel!
    
    var pro: String?
    var veg: String?
    
    
    
    private var metadata: LPLinkMetadata = LPLinkMetadata()
    
//    init(pro: String, veg: String){
//        self.pro = pro
//        self.veg = veg
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (pro == "Chicken"){
            if (veg == "Zucchini"){
                let url = URL(string: "https://www.cookingclassy.com/healthy-lemon-parmesan-chicken-and-veggies-cooking-classy/")!
                fetchURLPreview(url: url)
            }
        }

        // Do any additional setup after loading the view.
    }

    @available(iOS 13.0, *)
    func fetchURLPreview(url: URL){
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

