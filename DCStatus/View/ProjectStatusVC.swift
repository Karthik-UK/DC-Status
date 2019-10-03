import UIKit

class ProjectStatusVC: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var ProjectStatustableView: UITableView!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.addBackgroundView()
        ProjectStatustableView.tableFooterView = UIView()
        ProjectStatustableView.register(UINib(nibName: String(describing: ProjectStatusCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProjectStatusCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getDataFromCSV()
        reloadTableView()
    }
    
    @IBAction private func onClickofSegment(_ sender: Any) {
        reloadTableView()

    }
    
    private func reloadTableView() {
        ProjectStatustableView.reloadData()
    }
}

extension ProjectStatusVC: UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case Constants.Segment.janSep:
            return viewModel.dataSrc?[1].rows.count ?? 1
        case Constants.Segment.octDec:
            return viewModel.dataSrc?[0].rows.count ?? 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProjectStatusCell.self)) as? ProjectStatusCell else { return ProjectStatusCell() }

        cell.selectionStyle = .none
        switch segmentedControl.selectedSegmentIndex {
        case Constants.Segment.janSep:
            cell.taskNameLabel.text = viewModel.dataSrc?[1].rows[indexPath.row].initiative
            cell.pilotLaunchStatusLabel.text = viewModel.dataSrc?[1].rows[indexPath.row].pilotDate
            cell.clientLaunchStatusLabel.text = viewModel.dataSrc?[1].rows[indexPath.row].clientLaunchDate
        case Constants.Segment.octDec:
            cell.taskNameLabel.text = viewModel.dataSrc?[0].rows[indexPath.row].initiative
            cell.pilotLaunchStatusLabel.text = viewModel.dataSrc?[0].rows[indexPath.row].pilotDate
            cell.clientLaunchStatusLabel.text = viewModel.dataSrc?[0].rows[indexPath.row].clientLaunchDate
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: String(describing: InitiativeVC.self)) as? InitiativeVC else { return }
        
        viewController.viewModel = viewModel
        switch segmentedControl.selectedSegmentIndex {
        case Constants.Segment.janSep:
            viewModel.setCurrentRow(index: indexPath.row, section: 1)
        case Constants.Segment.octDec:
            viewModel.setCurrentRow(index: indexPath.row, section: 0)
        default:
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

