//
//  MerchantTableViewCell.swift
//  parallaxTable
//
//  Created by Soul on 07/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import UIKit

class MerchantTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
