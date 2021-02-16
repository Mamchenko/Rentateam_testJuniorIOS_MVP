//
//  Extension .swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation
import UIKit

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}

extension Date {
    func currentDateToString () -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
