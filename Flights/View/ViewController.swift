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
        return output.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = output.getObject(indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier) as! TableViewCell
        cell.set(title: object.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
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
