//
//  Singleton.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 16.02.2021.
//

import Foundation

class Singleton {

    static let shared = Singleton()
    let databaseManager = DatabaseManager()
    let networkManager = NetworkManager()
    let database = DatabaseManager()

    private init () {
    }
    var currentDate: [Date]?
    var arrayOfCharactersObject: [Characters] = []
    var arrayofRealmObject : [RealmModel] = []
    var arrayOfDataImage: [Data] = []
    
    
    func appendArrayOfImageData () {
        networkManager.getDataFromStringURL { [weak self] (data) -> (Void) in
            self?.arrayOfDataImage.append(data)
        }
    }

}
