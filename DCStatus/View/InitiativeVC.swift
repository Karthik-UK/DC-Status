import UIKit

class InitiativeVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    weak var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXibs()
        navigationItem.title = Constants.initiativeTitle
        tableView.tableFooterView = UIView()
    }
    
    func registerXibs() {
        tableView.register(UINib(nibName: String(describing: DescriptionTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DescriptionTVCell.self))
        tableView.register(UINib(nibName: String(describing: LaunchDateTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: LaunchDateTVCell.self))
        tableView.register(UINib(nibName: String(describing: OnlineMobileTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: OnlineMobileTVCell.self))
    }
}

extension InitiativeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.initTVCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSwitch = Constants.InitTVCells(rawValue: indexPath.row)
        switch cellSwitch {
        case .description?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTVCell.self), for: indexPath) as? DescriptionTVCell else { return UITableViewCell() }
            
            cell.initiativeLabel.text = viewModel?.currentRow?.initiative
            cell.descpLabel.text = viewModel?.currentRow?.description
            return cell
        case .launchDates?:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LaunchDateTVCell.self), for: indexPath) as? LaunchDateTVCell else { return UITableViewCell() }
            
            cell.pilotLaunchLabel.text = viewModel?.currentRow?.pilotDate
            cell.clientLaunchLabel.text = viewModel?.currentRow?.clientLaunchDate
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OnlineMobileTVCell.self), for: indexPath) as? OnlineMobileTVCell else { return UITableViewCell() }

            
            cell.labelHeading.text = Constants.initiativeHeading[indexPath.row - 2]
            cell.valueLabel.text = viewModel?.currentRow?.partialArrayRepresentation[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
