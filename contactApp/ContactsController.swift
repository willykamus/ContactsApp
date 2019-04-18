//
//  ViewController.swift
//  contactApp
//
//  Created by William Ching on 2019-04-17.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit
import CoreData

let appdelegate = UIApplication.shared.delegate as? AppDelegate

class ContactsController: UIViewController {
    
    let cellid = "CellId"
    
    let segueId = "contactDetail"
    
    @IBOutlet weak var contactsTable: UITableView!
    
    var listContacts = [Contact]()
    
    var contactSelected:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadData()
        fetchContacts()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //print(contactSelected?.name)
        let detail = segue.destination as! ContactDetailController
        
        let indexPath = contactsTable.indexPathForSelectedRow!
        
        detail.getContact = listContacts[indexPath.row]
        

    }
    
    
    func loadData() {
        
        guard let context = appdelegate?.persistentContainer.viewContext else { return }
        
        let contact = Contact(context: context)
        contact.company = "LaSalle"
        contact.name = "Sahil"
        contact.phone = "514-9999999"
        contact.position = "Student"
        contact.surName = "Gogna"
        contact.email = "sahil@gmail.com"
        do{
            try context.save()
            //print("Load")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

extension ContactsController {
    
    func fetchContacts(){
        
        guard let context = appdelegate?.persistentContainer.viewContext else { return }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        
        do {
            try listContacts = context.fetch(request) as! [Contact]
            //print(listContacts)
            //print("fetch complete")
            
        } catch {
            print("Fail to retrieve data")
            print(error.localizedDescription)
        }
        
    }
    
}

extension ContactsController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let contact = listContacts[indexPath.row]
//        //This did not work
//        //Eventhough I print the variable and I see the values
//        contactSelected = contact
//        //print(contactSelected)
//        self.performSegue(withIdentifier: segueId, sender: nil)
//
//    }
    
}

extension ContactsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listContacts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! ContactTableViewCell
        
        let contact = listContacts[indexPath.row]
        
        cell.fullNameLabel.text = contact.name! + ", " + contact.surName!
        cell.positionCompanyLabel.text = contact.position! + ", " + contact.company!
        
        return cell
    }
    
}


