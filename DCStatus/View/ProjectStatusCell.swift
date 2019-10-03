//
//  ProjectStatusCellTableViewCell.swift
//  DCStatus
//
//  Created by Karthik UK on 01/10/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import UIKit

class ProjectStatusCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var clientLaunchStatusLabel: UILabel!
    @IBOutlet weak var pilotLaunchStatusLabel: UILabel!
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.size.height -= 2 * 16
            super.frame = frame
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
