//
//  ContactListViewController.swift
//  PhoneBook
//
//  Created by Илья Маркелов on 09.11.2021.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var contactList = Contact.getRandomContactList()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = contactList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactList[indexPath.row]
        performSegue(withIdentifier: "contactDetails", sender: contact)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactDetailsVC = segue.destination as? ContactDetailsViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let contact = contactList[indexPath.row]
        contactDetailsVC.contact = contact
        contactDetailsVC.title = contact.fullName
    }
}
