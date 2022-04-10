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
    private var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        view = backgroundView
        
        view.addSubview(objectTitleLabel)
        objectTitleLabel.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        objectTitleLabel.text = objectTitle
        objectTitleLabel.center = view.center
        objectTitleLabel.font.withSize(CGFloat(15))
    }
    
    @objc private func buttonAction() {
        
    }
}

