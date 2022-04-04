import Foundation

protocol ViewInput: AnyObject {
    var output: ViewOutput! { get set }
    
    func reloadData()
}
