import UIKit.UIView

extension UIView {
    func pin(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return "\(Self.self)"
    }
}
