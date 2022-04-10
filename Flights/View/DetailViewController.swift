//
//  DetailViewController.swift
//  Flights
//
//  Created by Ars Paev on 12.03.2022.
//

import UIKit
import Hero

class DetailViewController: UIViewController {
    var objectTitle: String!
    
    private let objectTitleLabel = UILabel()
    private let button = UIButton()
    private var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        view = backgroundView
        
        view.addSubview(button)
        image = UIImage(systemName: "video")!
        button.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        button.backgroundColor = .systemPink
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(objectTitleLabel)
        objectTitleLabel.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        objectTitleLabel.text = objectTitle
        objectTitleLabel.center = view.center
    }
    
    @objc private func buttonAction() {
        
    }
}

