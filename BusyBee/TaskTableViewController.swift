//
//  TaskTableViewController.swift
//  BusyBee
//
//  Created by Anya Westby on 3/28/22.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    var taskList = [Task]()
    var taskData = TaskHandler()
    
    func engage(){
        taskList = taskData.getTasks()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        taskData.setupData()
        taskList = taskData.getTasks()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return taskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        var configuration = cell.defaultContentConfiguration()
        let task = taskList[indexPath.row]
        configuration.text = task.title
        cell.contentConfiguration = configuration
        cell.accessoryType = task.completed ? .checkmark : .none

        return cell
    }
    
    
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let notice = UIAlertController(title: "New Task", message: "You are one busy bee! Add a new task to your to-do list", preferredStyle: .alert)
        
        notice.addTextField(configurationHandler: {(UITextField) in })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        notice.addAction(cancel)
        
        let addTaskToList = UIAlertAction(title: "Add", style: .default, handler: {(UIAlertAction) in
            let newTask = notice.textFields![0]
            let newTaskItem = Task()
            newTaskItem.title = newTask.text!
            newTaskItem.completed = false
            self.taskData.addTask(newTask: newTaskItem)
            self.engage()
        })
        notice.addAction(addTaskToList)
        present(notice, animated: true, completion: nil)
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let completedTask = taskList[indexPath.row]
        taskData.completedTask(task: completedTask)
        engage()
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = taskList[indexPath.row]
            taskData.removeTask(task: task)
            engage()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
