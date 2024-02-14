//
//  Task.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/15.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var completed: Bool = false
}
