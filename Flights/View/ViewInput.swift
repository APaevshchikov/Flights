import Foundation
import UIKit

protocol ViewInput: AnyObject {
    var output: ViewOutput! { get set }
    
    func setupView(with content: Content)
    func reloadData()
}
