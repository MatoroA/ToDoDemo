//
//  RealmManager.swift
//  ToDoDemo
//
//  Created by Andani Matoro on 2024/02/14.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set)  var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    private func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("something went wrong=> error: \(error)")
        }
    }
    
    func addTask(title: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": title, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("new task has been added!!!")
                }
            } catch {
                print("something went wrong adding a task!: \(error)")
            }
        }
    }
    
    private func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    taskToUpdate.first?.completed = completed
                    getTasks()
                    print("task has been updated")
                }
            } catch {
                print("failed to update task with id \(id)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("task with id = \(id) has been deleted")
                }
            } catch {
                print("Failed to delete task with id = \(id)")
            }
        }
    }
    
}
