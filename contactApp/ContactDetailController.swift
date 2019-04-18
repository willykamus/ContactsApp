//
//  ContactDetailController.swift
//  contactApp
//
//  Created by William Ching on 2019-04-17.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit
import CoreData

class ContactDetailController: UITableViewController {
    
    
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var positionCompanyLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    weak var getContact:Contact!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullName.text = getContact.name! + " " + getContact.surName!
        positionCompanyLabel.text = getContact.position! + ", " + getContact.company!
        emailLabel.text = getContact.email
        phoneLabel.text = getContact.phone

        //If I try to pass the object with the regular
        //assigning the object to the value
        //I receive a nil here
        //print(getContactn contact")
        //print(contact?.name) for some reason this prints nil
        
        
        //loadSelectedContact()

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
