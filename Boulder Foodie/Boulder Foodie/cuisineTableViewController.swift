//
//  cuisineTableViewController.swift
//  Boulder Foodie
//
//  Created by Anya Westby on 2/9/22.
//

import UIKit

class cuisineTableViewController: UITableViewController {
    
    var cuisineList = [String]()
    var cuisineData = CuisineDataLoader()
    let dataFile = "cuisines"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cuisineData.loadMyData(filename: dataFile)
        cuisineList = cuisineData.getCuisines()
        
        let app = UIApplication.shared
        
        NotificationCenter.default.addObserver(self, selector: #selector(cuisineTableViewController.applicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: app)
        
        //uncomment if I want larger title
        //navigationController?.navigationBar.prefersLargeTitles = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func applicationWillResignActive(_ notification: NSNotification){
        cuisineData.writeData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuisineList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cuisineCell", for: indexPath)

        // Configure the cell...
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = cuisineList[indexPath.row]
        cell.contentConfiguration = cellConfiguration

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restaurantsegue"{
            if let restaurantView = segue.destination as? RestaurantTableViewController{
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!){
                    restaurantView.title = cuisineList[indexPath.row]
                    restaurantView.cuisineData = cuisineData
                    restaurantView.selectedCuisine = indexPath.row
                }
            }
        }
        else if segue.identifier == "cuisinesegue"{
            if let infoView = segue.destination as? CuisineInfoTableViewController{
                if let editCell = sender as? UITableViewCell{
                    let indexPath = tableView.indexPath(for: editCell)
                    infoView.name = cuisineList[indexPath!.row]
                    let restaurantList = cuisineData.getRestaurants(index: (indexPath?.row)!)
                    infoView.number = String(restaurantList.count)
                }
            }
        }
    }
}
