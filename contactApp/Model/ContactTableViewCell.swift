//
//  ContactTableViewCell.swift
//  contactApp
//
//  Created by William Ching on 2019-04-17.
//  Copyright © 2019 William Ching. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var positionCompanyLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
