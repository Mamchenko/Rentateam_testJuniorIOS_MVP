//
//  InfoViewController.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController, InfoViewControllerProtocol {
    var presenter: InfoViewControllerPresenterProtocol?
    var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.masksToBounds = true 
        view.layer.cornerRadius = 10
        return view
    }()
    
    var dateLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: view.font.pointSize, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = InfoViewControllerPresenter(controller: self)
        configureConstraints()
       
        
    }
    
    private func configureConstraints () {
        
        
        
        [imageView, dateLabel].forEach {view.addSubview($0)}
        
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(32)
            make.trailing.equalTo(self.view.snp.trailing).offset(-32)
            make.top.equalTo(self.view.snp.top).offset(96)
            make.height.equalTo(self.view).multipliedBy(0.5)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(48)
            make.trailing.equalTo(self.view.snp.trailing).offset(-48)
            make.top.equalTo(imageView.snp.bottom).offset(48)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
        
        view.backgroundColor = UIColor(named: "mainBckgroundColor")
    }
   
    
}

protocol InfoViewControllerProtocol {
    
}
