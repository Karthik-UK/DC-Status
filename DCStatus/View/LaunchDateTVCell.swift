//
//  LaunchDateTVCell.swift
//  DCStatus
//
//  Created by Karthik UK on 03/10/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class LaunchDateTVCell: UITableViewCell {
    
    @IBOutlet weak var pilotLaunchLabel: UILabel!
    @IBOutlet weak var clientLaunchLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
