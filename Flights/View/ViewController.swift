import UIKit

class ViewController: UIViewController {
    var output: ViewOutput!
    
    private let tableView = UITableView()
    private let loadintView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = output.getNavigationBarTitle()
        output.viewDidLoad()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.pin(to: view)
    }
    
    private func configureLoadingView() {
        view.addSubview(loadintView)
        loadintView.frame.size.width = view.frame.size.width / 4
        loadintView.frame.size.height = view.frame.size.height / 4
        loadintView.center = view.center
        loadintView.backgroundColor = .red
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
    
    func setupView(with content: Content) {
        switch content {
        case .tableView:
            if !view.subviews.contains(where: { $0 == tableView }) {
                configureTableView()
            }
            loadintView.removeFromSuperview()
        case .loadingView:
            if !view.subviews.contains(where: { $0 == loadintView }) {
                configureLoadingView()
            }
            tableView.removeFromSuperview()
        }
    }
}
