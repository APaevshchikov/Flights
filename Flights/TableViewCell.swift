import UIKit

class TableViewCell: UITableViewCell {

    private var image = UIImageView()
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(image)
        addSubview(titleLabel)
        
        configureImageView()
        configureTitleLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        titleLabel.text = title
//        image.image = video.image
    }
    
    private func configureImageView() {
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }
    
    private func configureTitleLabel() {
        titleLabel.numberOfLines = 0
    }
    
    private func setImageConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
//        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 16 / 9).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
