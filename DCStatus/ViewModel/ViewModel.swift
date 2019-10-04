import Foundation

class ViewModel {
    
    private var csvParser = CSVPasrserManager()
    var fileName: String?
    var dataSrc: [Section]?
    var currentRow: Section.Row?
    
    /// Sets the file name
    ///
    /// - Parameter fileName: Name of the file
    func setFileName(fileName: String) {
        self.fileName = fileName
    }
    
    /// Sets the current row of the model
    ///
    /// - Parameters:
    ///   - index: Index of the row to set
    ///   - section: Section in which the row resides
    func setCurrentRow(index: Int, section: Int) {
        currentRow = dataSrc?[section].rows[index]
    }
    
    /// Retrieves data from the CSV file
    func getDataFromCSV() {
        dataSrc = csvParser.parseCSVFile(fileName: fileName ?? "")
    }
}
