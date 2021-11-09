//
//  FullDetailsViewController.swift
//  PhoneBook
//
//  Created by Илья Маркелов on 09.11.2021.
//

import UIKit

class FullDetailsViewController: UITableViewController {
    
    var contactList = Contact.getRandomContactList()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contactList[section].fullName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fullDetails", for: indexPath)
        let contact = contactList[indexPath.section]
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.text = contact.phone
            content.image = UIImage(systemName: "phone")
        } else {
            content.text = contact.email
            content.image = UIImage(systemName: "tray")
        }
        cell.contentConfiguration = content
        return cell
    }


}
