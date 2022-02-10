//
//  RestaurantTableViewController.swift
//  Boulder Foodie
//
//  Created by Anya Westby on 2/9/22.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchBarDelegate {
    
    var cuisineData = CuisineDataLoader()
    var selectedCuisine = 0
    var restaurantList = [String]()
    
    //SEARCH BARRRRR
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredrestaurants: [String]!
    
    override func viewWillAppear(_ animated: Bool) {
        restaurantList = cuisineData.getRestaurants(index: selectedCuisine)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredrestaurants = restaurantList
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //displays an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)

        // Configure the cell...
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.text = restaurantList[indexPath.row]
        cell.contentConfiguration = cellConfiguration

        return cell
    }
    

    
    //supports conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    //Supports editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete restaurant from array
            restaurantList.remove(at: indexPath.row)
            
            //delete the row from table
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //delete from data model
            cuisineData.removeRestaurant(index: selectedCuisine, restaurantIndex: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Supports rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let from = fromIndexPath.row
        let to = to.row
        let move = restaurantList[from]
        
        restaurantList.swapAt(from, to)
        
        cuisineData.removeRestaurant(index: selectedCuisine, restaurantIndex: from)
        
        cuisineData.addRestaurant(index: selectedCuisine, newRestaurant: move, newIndex: to)

    }
    

    
    // Supports conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            if let source = segue.source as? AddRestaurantViewController{
                if source.addedRestaurant.isEmpty == false{
                    cuisineData.addRestaurant(index: selectedCuisine, newRestaurant: source.addedRestaurant, newIndex: restaurantList.count)
                    
                    restaurantList.append(source.addedRestaurant)
                    tableView.reloadData()
                }
            }
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredrestaurants = []
        
        if searchText == ""{
            filteredrestaurants = restaurantList
        }
        else{
            for restaurant in restaurantList{
                if restaurant.lowercased().contains(searchText.lowercased()){
                    filteredrestaurants.append(restaurant)
                    
                }
            }
        }
        
        self.tableView.reloadData()
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
