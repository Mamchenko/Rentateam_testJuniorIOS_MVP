//
//  InfoViewController.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    var imageView: UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }
    
    var dateLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        
    }
    
    private func configureConstraints () {
        
        let photoView = imageView
        let timeLabel = dateLabel
        
        [photoView, timeLabel].forEach {view.addSubview($0)}
        
        photoView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(32)
            make.trailing.equalTo(self.view.snp.trailing).offset(-32)
            make.top.equalTo(self.view.snp.top).offset(96)
            make.height.equalTo(self.view).multipliedBy(0.5)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(48)
            make.trailing.equalTo(self.view.snp.trailing).offset(-48)
            make.top.equalTo(photoView.snp.bottom).offset(48)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
        
        view.backgroundColor = UIColor(named: "mainBckgroundColor")
    }
   
    
}
