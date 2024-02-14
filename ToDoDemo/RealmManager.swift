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
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("something went wrong=> error: \(error)")
        }
    }
}
