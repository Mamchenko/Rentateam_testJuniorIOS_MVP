//
//  ImageCollectionViewPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation


class CharactersPresenter: CharactersPresenterProtocol {
    
    var arrayOfCharacters  : [Result] = []
  var networkManager = NetworkManager()
    var dataLoaded: Bool?
    var controller : CharactersViewControllerProtocol
    
     init (controller: CharactersViewControllerProtocol ) {
        self.controller = controller
    }
   
    
     func getArrayOfCharacters () {
        networkManager.getData {  (result) -> (Void) in
            //self.controller.startLoading()
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.arrayOfCharacters = posts
                    self.dataLoaded = true
                    self.dataCheck()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func dataCheck () {
        if dataLoaded != nil {
            controller.collectionViewReloaded()
            controller.stopLoading()
            
        }
    }
}

protocol CharactersPresenterProtocol {
    func getArrayOfCharacters ()
}
