//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 13/10/21.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    static let databaseManager = DatabaseManager()
    var ref: DatabaseReference?
    
    private init() {
        ref = Database.database().reference()
    }
    
    func readData() {
        ref?.child("users").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            print("Name: \(name)")
            
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
}
