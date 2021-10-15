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
    
    func readData(callback: ([Message]) -> Void) {
        ref?.child("users").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            print("Name: \(name)")
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchMessages(callback: @escaping ([Message]) -> Void) {
        ref?.child("messages").observeSingleEvent(of: .value, with: { snapshot in
            let messages = snapshot.value as? Array<Any>
            guard let messages = messages else { return }
            var messagesRet: [Message] = []
            for m in messages {
                let messageDict = m as? NSDictionary
                let message = Message(messageId: messageDict?["messageId"] as? Int ?? 0,
                                      message: messageDict?["message"] as? String ?? "",
                                      senderId: messageDict?["senderId"] as? Int ?? 0,
                                      senderName: messageDict?["senderName"] as? String ?? "",
                                      date: messageDict?["date"] as? String ?? "",
                                      time: messageDict?["time"] as? String ?? "")
                messagesRet.append(message)
            }
            callback(messagesRet)
        }) { error in
            print("Error: \(error.localizedDescription)")
        }
    }
}
