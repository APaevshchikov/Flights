//
//  DetailViewController.swift
//  Flights
//
//  Created by Ars Paev on 12.03.2022.
//

import UIKit
import Hero

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        view = backgroundView
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemPink
        let image = UIImage(systemName: "video")!
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction() {
        
    }
}

