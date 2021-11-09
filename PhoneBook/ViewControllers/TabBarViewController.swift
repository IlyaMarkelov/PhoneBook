//
//  TabBarViewController.swift
//  PhoneBook
//
//  Created by Илья Маркелов on 09.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let contactList = Contact.getRandomContactList()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     func setUpViewControllers(with contact: [Contact]) {
         guard let contactList = viewControllers?.first as? ContactListViewController else {return}
         guard let fullDetailsVC = viewControllers?.last as? FullDetailsViewController else {return}
         contactList.contactList = contact
         fullDetailsVC.contactList = contact
     }
}
