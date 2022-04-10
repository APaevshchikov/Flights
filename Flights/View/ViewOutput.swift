import Foundation

protocol ViewOutput: AnyObject {
    var view: ViewInput! { get set }
    var interactor: InteractorInput! { get set }
    
    func viewDidLoad()
    func getNumberOfRows() -> Int
    func getObject(_ indexPath: IndexPath) -> HeroDTO
    func getNavigationBarTitle() -> String
}
