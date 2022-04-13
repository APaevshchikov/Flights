import Foundation

protocol ViewOutput: AnyObject {
    var view: ViewInput! { get set }
    
    func viewDidLoad()
    func getNumberOfRows() -> Int
    func getObject(_ indexPath: IndexPath) -> HeroDTO
    func getNavigationBarTitle() -> String
    func prefetchRowAt(_ indexPath: IndexPath)
}
