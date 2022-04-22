//
//  recipeViewController.swift
//  PrepRite
//
//  Created by Anya Westby on 4/21/22.
//

import UIKit
import WebKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class recipeViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var recipeView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    let database = Firestore.firestore()
    
    var website : String?
  
    
    @IBOutlet weak var heart: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeView.navigationDelegate = self
        if website == "" {
            loadPage("https://cooking.nytimes.com")
        }
        else{
            loadPage(website!)
        }
        
        configureUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Bookmark")

    }
    
    func loadPage(_ urlString: String){
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        recipeView.load(request)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    @IBAction func heartPressed(_ sender: UIBarButtonItem) {
        if heart.title == "heart"{
            let selectedImage = UIImage(systemName: "heart.fill")
            heart.title = "heart.fill"
            heart.image = selectedImage
//            database.collection("recipeList")
//                .document()
//                .update({
//                    "bookmarked": true
//                });
        } else {
            let selectedImage = UIImage(systemName: "heart")
            heart.title = "heart"
            heart.image = selectedImage
        }
    }
    
    func configureUI(){
        let normImage = UIImage(systemName: "heart")
        heart.title = "heart"
        heart.image = normImage
    }

}
