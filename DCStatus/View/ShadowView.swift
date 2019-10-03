//
//  ShadowView.swift
//  DCStatus
//
//  Created by Karthik UK on 03/10/19.
//  Copyright © 2019 Karthik UK. All rights reserved.
//

import Foundation
import UIKit

class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowColor = Constants.uiShadowColor.cgColor
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
