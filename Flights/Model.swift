import UIKit.UIImage

struct VideoModel {
    var sectionName: String
    var videos: [Video]
}

struct Video {
    var image: UIImage
    var title: String
}
