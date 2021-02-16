//
//  DatabaseManager.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 16.02.2021.
//

import Foundation
import RealmSwift

class CRUD {
    
    let realm = try! Realm()
    
    
    func create (date: Date, imageData: Data) {
        
        do {
            let modelObject = RealmModel()
            modelObject.createdAt = date
            modelObject.imageData = imageData
            try realm.write({
                realm.add(modelObject)
            })
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getObjects () -> [RealmModel] {
        let arrayOfResult = realm.objects(RealmModel.self)
        return Array(arrayOfResult)
    }
}

