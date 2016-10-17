//
//  TumblrViewCell.swift
//  tumblr
//
//  Created by Phillip Pang on 10/12/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit
import AFNetworking

class DemoPrototypeCell: UITableViewCell {

    @IBOutlet weak var tumblrImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
