import UIKit

class TableViewCell: UITableViewCell {

    private var image = UIImageView()
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        
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
    }
    
    func set(imageData: Data) {
        image.image = UIImage(data: imageData)
    }
    
    func setImagePlaceholder(name: String) {
        if let assetsImage = UIImage(named: name) {
            image.image = assetsImage
        } else if let sfSymbolsImage = UIImage(systemName: name) {
            image.image = sfSymbolsImage
        }
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
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            image.heightAnchor.constraint(equalToConstant: 44),
            image.widthAnchor.constraint(equalTo: image.heightAnchor)
        ])
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: image.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: image.topAnchor)
        ])
        
    }
}
