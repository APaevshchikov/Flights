import Foundation

protocol ViewOutput: AnyObject {
    var view: ViewInput! { get set }
    var interactor: InteractorInput! { get set }
    
    func viewDidLoad()
    func numberOfRows(_ section: Int) -> Int
    func getVideosCount() -> Int
    func getSection(_ indexPath: IndexPath) -> VideoModel
    func titleForHeaderInSection (_ section: Int) -> String
    func getNavigationBarTitle() -> String
}
