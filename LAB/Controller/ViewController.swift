//
//  ViewController.swift
//  LAB
//
//  Created by Kirill Sheremetev on 01.03.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var marvelLogoImageView = UIImageView()
    let marvelLogoImage = UIImage(named: "logoMarvel")
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "Choose your hero"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
                
        marvelLogoImageView = UIImageView(image: marvelLogoImage)
        marvelLogoImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        marvelLogoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view.addSubview(marvelLogoImageView)
        marvelLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalTo(marvelLogoImageView).inset(60)
            $0.centerX.equalToSuperview()
        }
        
    }


}

