//
//  ViewController.swift
//  Lab5
//
//  Created by Anya Westby on 2/28/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var animals = [Animal]()
    var animalDataHandler = AnimalDataHandler()
    
    @IBOutlet weak var animalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        getAPIdata()
    }
    
    func getAPIdata(){
        Task{
            await animalDataHandler.loadjson()
            animals = animalDataHandler.getAnimals()
            animalTableView.reloadData()
            print ("Number of animals \(animals.count)")
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(animals.count)
        
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = animals[indexPath.row].name
        cell.contentConfiguration = cellConfig
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: animals[indexPath.row].name, message: animals[indexPath.row].latin_name, preferredStyle: .alert)
        //Create URL
        let url = URL(string: animals[indexPath.row].image_link)!
        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 50))
                    imageView.image = UIImage(data: data)
                    alert.view.addSubview(imageView)
               }
           }
       }
        
        let okAction = UIAlertAction(title: "Neat", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}

