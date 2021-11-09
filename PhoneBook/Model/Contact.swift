//
//  Contact.swift
//  PhoneBook
//
//  Created by Илья Маркелов on 09.11.2021.
//

struct Contact {
    let name: String
    let secondName: String
    let email: String
    let phone: String
    
    var fullName: String {
        name + " " + secondName
    }
}

extension Contact {
    static func getRandomContactList() -> [Contact] {
        var contacts: [Contact] = []
        
        let data = DataManager.dataManager
        
        let namesShuffled = data.name.shuffled()
        let seсondNamesShuffled = data.surname.shuffled()
        let emailsShuffled = data.email.shuffled()
        let phonesShuffled = data.phone.shuffled()
        
        for i in 0..<namesShuffled.count {
            let contact = Contact(
                name: namesShuffled[i],
                secondName: seсondNamesShuffled[i],
                email: emailsShuffled[i],
                phone: phonesShuffled[i]
            )
            
            contacts.append(contact)
        }
        
        
        return contacts
    }
}

