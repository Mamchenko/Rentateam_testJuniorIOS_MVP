//
//  Model.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation
import RealmSwift

class RealmRickAndMortyModel: Object {
    @objc dynamic var imageData: Data? = nil
    @objc dynamic var createdAt: Date = Date(timeIntervalSince1970: 1)
    @objc dynamic var imageURL: String? = nil
    
    
}
 
 
