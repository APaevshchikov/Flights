import Foundation
import UIKit

protocol ViewInput: AnyObject {
    var output: ViewOutput! { get set }
    
    func setupView(with content: Content)
    func setImageData(_ imageData: Data)
    func setImagePlaceholder(name: String)
    func reloadData()
}
