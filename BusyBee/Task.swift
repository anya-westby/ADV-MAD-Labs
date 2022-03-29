//
//  Task.swift
//  BusyBee
//
//  Created by Anya Westby on 3/28/22.
//

import Foundation
import RealmSwift

class Task: Object{
    @Persisted(primaryKey: true) var _id = ObjectId.generate()
    @Persisted var title = ""
    @Persisted var completed = false
}
