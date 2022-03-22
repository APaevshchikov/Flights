import UIKit

class TableViewCell: UITableViewCell {

    private var videoImageView = UIImageView()
    private var videoTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video) {
        videoTitleLabel.text = video.title
        videoImageView.image = video.image
    }
    
    private func configureImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    private func configureTitleLabel() {
        videoTitleLabel.numberOfLines = 0
    }
    
    private func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        
//        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        videoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        videoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16 / 9).isActive = true
//        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        videoTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        videoTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
