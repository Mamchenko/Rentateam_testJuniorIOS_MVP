//
//  ImageViewCollectionViewCell.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import UIKit
import SnapKit



class CharactersCollectionViewCell: UICollectionViewCell {
    
    
    
    var imageView: UIImageView =  {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var nameLabel: UILabel =  {
        let view: UILabel = UILabel()
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
    
    func configConstraints () {
        
        [imageView, nameLabel].forEach {addSubview($0)}
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(self).multipliedBy(0.6)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
    }
}
