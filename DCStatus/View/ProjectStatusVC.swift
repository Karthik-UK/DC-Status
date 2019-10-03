import UIKit

class ProjectStatusVC: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var ProjectStatustableView: UITableView!
    
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.addBackgroundView()
        ProjectStatustableView.tableFooterView = UIView()
        let nib = UINib(nibName: "ProjectStatusCell", bundle: nil)
        self.ProjectStatustableView.register(nib, forCellReuseIdentifier: String(describing: ProjectStatusCell.self))
        print("a")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getDataFromCSV()
        reloadTableView()
    }
    
    @IBAction private func onClickofSegment(_ sender: Any) {
        reloadTableView()
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            print("")
        case 1: print("b")
        default: break
        }
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
            
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = false
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
            print("")
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
            print("")
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

