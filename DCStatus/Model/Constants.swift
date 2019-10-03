import UIKit

struct Constants {
    static let filePath = "Product InitiativesSummary Sept302019"
    static let filePath2 = "TP-YML-iOS"
    static let filePath3 = "TestSheet"
    static let filePath5 = "TestSheet2"
    static let filePath4 = "Product InitiativesSummary Sept302019"
    static let stringNil = "nil"
    static let hashString = "#"
    static let first = 1
    static let uiShadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0)
    static let toBeDecided = "TBD"
    static let notAvailable = "NA"
    static let segementTitles = ["Jan - Sep 2019", "Oct - Dec 2019"]
    static let initTVCellCount = 6
    static let initiativeTitle = "Initiative"
    static let initiativeHeading = ["Online", "Mobile", "DAA", "Wealth"]
    struct FileTypes {
        static let csv = "csv"
        static let xlsx = "xlsx"
    }
    enum InitTVCells: Int {
        case description = 0
        case launchDates = 1
        case otherData = 2
    }
    struct Segment {
        static let janSep = 0
        static let octDec = 1
    }
}
