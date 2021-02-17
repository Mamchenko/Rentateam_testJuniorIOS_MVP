//
//  Extension .swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation
import UIKit

extension Data {
    func toImage() -> UIImage? {
        let image = UIImage(data: self)
        return image 
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
