import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    var output: ViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Videos or Flights"
        configureTableView()
        
        output.viewDidLoad()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.pin(to: view)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = output.getSection(indexPath)
        let video = section.videos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier) as! TableViewCell
        cell.set(video: video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        output.getVideosCount()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        containerView.backgroundColor = .brown
        let label = UILabel()
        label.text = output.titleForHeaderInSection(section)
        label.frame = containerView.bounds
        containerView.addSubview(label)
        
        return containerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if output.titleForHeaderInSection(section).isEmpty {
            return 0
        } else {
            return 30
        }
    }
}

extension ViewController: ViewInput {
    func reloadData() {
        tableView.reloadData()
    }
}
