import Foundation
import UIKit

extension UISegmentedControl {
    func addBackgroundView() {
        let segmentGrayColor = Constants.segmentControlColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10.0
        layer.borderColor = segmentGrayColor.cgColor
        layer.masksToBounds = true
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    }
}


