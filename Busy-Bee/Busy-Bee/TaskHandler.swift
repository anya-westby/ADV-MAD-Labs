//
//  TaskHandler.swift
//  Busy-Bee
//
//  Created by Anya Westby on 3/29/22.
//

import Foundation
import RealmSwift

class TaskHandler{
    var myRealm : Realm!
    var taskData: Results<Task>
    {
        get{
            return myRealm.objects(Task.self)
        }
    }
    
    func setupData(){
        do{
            myRealm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func addTask(newTask: Task){
        do{
            try myRealm.write({
                myRealm.add(newTask)
            })
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func completedTask(task: Task){
        do{
            try myRealm.write ({
                task.completed = !task.completed
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func removeTask(task: Task){
        do{
            try myRealm.write ({
                myRealm.delete(task)
            })
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func getTasks()->[Task]{
        return Array(taskData)
    }
}
