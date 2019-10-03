import Foundation
import UIKit

extension UISegmentedControl {
    func addBackgroundView() {
        let segmentGrayColor = UIColor(red: 0.889415, green: 0.889436, blue:0.889424, alpha: 1.0 )
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = segmentGrayColor.cgColor
        self.layer.masksToBounds = true
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    }
}


