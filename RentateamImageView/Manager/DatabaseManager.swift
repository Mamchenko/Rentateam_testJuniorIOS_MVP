//
//  DatabaseManager.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 16.02.2021.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    private lazy var realm = try! Realm()
    
    
    func create (date: Date, imageData: Data, imageURL: String) {
        do {
            let modelObject = RealmRickAndMortyModel()
            modelObject.createdAt = date
            modelObject.imageData = imageData
            modelObject.imageURL = imageURL
            try realm.write({
                realm.add(modelObject)
            })
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func getDataAndDate(by url: String) -> (Data?, Date?) {
        let data = Array(realm.objects(RealmRickAndMortyModel.self).filter({ $0.imageURL == url })).first?.imageData
        
        let date = Array(realm.objects(RealmRickAndMortyModel.self).filter({ $0.imageURL == url })).first?.createdAt
        
        return (data, date)
    }
}
