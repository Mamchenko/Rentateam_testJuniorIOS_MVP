//
//  ImageManager.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 17.02.2021.
//

import Foundation
import UIKit

class DateAndImageManager {
    
    private let db = DatabaseManager()
    private let networkManager = NetworkManager()
    
    func getObject (_ urlStr: String, complition: @escaping (UIImage, Date) -> Void) {
        let cortage = db.getDataAndDate(by: urlStr)
        if let dataImage = cortage.0 {
            complition(UIImage(data: dataImage) ?? UIImage(), cortage.1 ?? Date())
        } else {
            networkManager.getImageData(by: urlStr, complition: { [weak self] data in
                self?.db.create(date: Date(), imageData: data, imageURL: urlStr)
                complition(UIImage(data: data) ?? UIImage(), Date())
            })
        }
    }
}
