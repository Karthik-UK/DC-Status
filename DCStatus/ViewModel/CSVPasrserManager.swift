import Foundation

class CSVPasrserManager {
    private var fileContents: [[String]]?
    
    /// Function to open a csv file and get the contents
    ///
    /// - Parameter fileName: name of the file
    /// - Returns: The row contents in a specific model type
    func parseCSVFile(fileName: String) -> [Section] {
        openCSVFile(fileName: fileName)
        return formatRowContents()
    }
    /// Function to open the csv file and parse contents
    ///
    /// - Parameter fileName: Name of the file to parse
    private func openCSVFile(fileName: String) {
        guard  let filePath = Bundle.main.path(forResource: fileName, ofType: Constants.FileTypes.csv) else { return }
        
        let fileContents = try? String(contentsOfFile: filePath)
        var cleanedFileContents: [[String]] = [[]]
        let rows = fileContents?.components(separatedBy: "\r\n")
        for eachRow in rows ?? [""] {
            var values: [String] = []
            if eachRow.range(of: "\"") != nil {
                var scanText: String = eachRow
                var newStr: NSString?
                var textScanner = Scanner(string: scanText)
                while(textScanner.string != "") {
                    if (textScanner.string as NSString).substring(to: 1) == "\"" {
                        textScanner.scanLocation += 1
                        textScanner.scanUpTo("\",", into: &newStr)
                        textScanner.scanLocation += 1
                    } else if (textScanner.string as NSString).substring(to: 1) == "," {
                        newStr = ""
                    } else {
                        textScanner.scanUpTo(",", into: &newStr)
                    }
                    guard let newStr = newStr as String? else { return }
                    
                    values.append(newStr)
                    
                    if textScanner.scanLocation < textScanner.string.count {
                        scanText = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                    } else {
                        scanText = ""
                    }
                    textScanner = Scanner(string: scanText)
                }
                cleanedFileContents.append(values)
            } else {
                let columns = eachRow.components(separatedBy: ",")
                cleanedFileContents.append(columns)
            }
        }
        self.fileContents = cleanedFileContents
    }
    
    /// Funtion to take raw contents of the csv file and returns row contents in a specific format
    ///
    /// - Returns: Row contents in a specific format
    private func formatRowContents() -> [Section] {
        
        var sectionTitles: [String] = []
        var sectionContents: [[Section.Row]] = []
        var sectionCount = -1
        var dataSrc: [Section] = []
        
        guard let fileContents = fileContents else { return []}
        
        for row in fileContents {
            if row.first == "Table 1" || row.first == Constants.hashString || row.first?.isEmpty ?? true || row.isEmpty {
                continue
            } else if row[2].isEmpty {
                sectionTitles.append(row.first ?? "")
                sectionCount += 1
                sectionContents.append([])
            } else {
                var tempRow = row.enumerated().map { (index, element) -> String in
                    if element.isEmpty {
                        if index == 3 || index == 4 {
                            return Constants.toBeDecided
                        }
                        return Constants.notAvailable
                    }
                    return element
                }
                sectionContents[sectionCount].append(Section.Row(rowID: Int(tempRow[0]) ?? 0, initiative: tempRow[1], description: tempRow[2], pilotDate: tempRow[3], clientLaunchDate: tempRow[4], online: tempRow[5], mobile: tempRow[6], dda: tempRow[7], wealth: tempRow[8]))
            }
        }
        sectionCount = 0
        for section in sectionContents {
            if section.isEmpty{
                continue
            }
            dataSrc.append(Section(sectionID: sectionCount + 1, sectionTitle: sectionTitles[sectionCount], rows: section))
            sectionCount += 1
        }
        return dataSrc
    }
}
