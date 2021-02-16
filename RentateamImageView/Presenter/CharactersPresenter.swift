//
//  ImageCollectionViewPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation


class CharactersPresenter: CharactersPresenterProtocol {
    
    
    var arrayOfImageData: [Data] = []
    var getCharactersData: Bool = false
    
    func createRealmObject() {
        for o in arrayOfImageData {
            let date = Date()
            database.create(date: date, imageData: o)
            
        }
    }
    
    func getArrayOfImageData() {
        networkManager.getDataFromStringURL { (data) -> (Void) in
            if self.getCharactersData != false {
                self.arrayOfImageData.append(data)
            }
        }
    }
    
    
  var networkManager = NetworkManager()
    var controller: CharactersViewControllerProtocol
    var database = DatabaseManager()
    
     init (controller: CharactersViewControllerProtocol ) {
        self.controller = controller
    }
   
    
     func getArrayOfCharacters () {
        controller.startLoading()
        networkManager.getData {  (result) -> (Void) in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    Singleton.shared.arrayOfCharactersObject = posts.results
                    self.dataCheck()
                    self.getCharactersData = true
                    self.saveDateOfLoading()
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func dataCheck () {
            controller.stopLoading()
            controller.collectionViewReloaded()
    }
    
    private func saveDateOfLoading() {
        let dateOfLoading = Date()
        print ("data of loading \(dateOfLoading)")
    }
}

protocol CharactersPresenterProtocol {
    func getArrayOfCharacters ()
    func getArrayOfImageData ()
    func createRealmObject ()
}
