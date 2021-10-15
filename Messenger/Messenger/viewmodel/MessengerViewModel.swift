//
//  MessengerViewModel.swift
//  Messenger
//
//  Created by Eduardo Peregrino on 12/10/21.
//

import Foundation

class MessengerViewModel {
    
    var messageList = ["Name 1": "Message 1",
                       "Name 2": "Message 2",
                       "Name 3": "Message 3",
                       "Name 4": "Message 4",
                       "Name 5": "Message 5",
                       "Name 6": "Message 6",
                       "Name 7": "Message 7",
                       "Name 8": "Message 8",
                       "Name 9": "Message 9"]
    
    var messages: [Message] = [Message(messageId: 0, message: "Mensagem default", senderId: 0, senderName: "Sender Teste", date: "", time: "")]
    
    func initList() {
        DatabaseManager.databaseManager.fetchMessages(callback: addMessage)
    }
    
    func addMessage(_ messageList: [Message]) {
        messages.append(contentsOf: messageList)
    }
}
