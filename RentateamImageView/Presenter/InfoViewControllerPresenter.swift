//
//  InfoViewControllerPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 17.02.2021.
//

import Foundation
import UIKit

class InfoViewControllerPresenter: InfoViewControllerPresenterProtocol {
    
   weak var controller: InfoViewControllerProtocol?
   private let imageManager = DateAndImageManager()
    
    init(controller: InfoViewControllerProtocol?) {
        self.controller = controller
    }
    
    func getImageAndData(by urlStr: String, handler: @escaping (UIImage, Date) -> ()) {
        imageManager.getObject(urlStr) { (image, date) in
            handler (image, date)
        }
        
    }
}


