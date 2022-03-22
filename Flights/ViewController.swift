import UIKit
import Hero

protocol ViewOutput: AnyObject {
    var view: ViewInput! { get set }
    var interactor: InteractorInput! { get set }
    
    func viewDidLoad()
    func numberOfRows() -> Int
    func getVideos() -> [Video]
}

protocol ViewInput: AnyObject {
    var output: ViewOutput! { get set }
    
    func reloadData()
}

class ViewController: UIViewController {
    private let tableView = UITableView()
    var output: ViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Videos or Flights"
        configureTableView()
        configureHero()
        
        output.viewDidLoad()
    }
    
    private func configureHero() {
        self.hero.isEnabled = true
        view.hero.id = "ironMan"
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
        return output.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier) as! TableViewCell
        let video = output.getVideos()[indexPath.row]
        cell.set(video: video)
        
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
}
