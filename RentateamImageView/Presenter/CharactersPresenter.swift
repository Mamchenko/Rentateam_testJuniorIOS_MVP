//
//  ImageCollectionViewPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation


class CharactersPresenter: CharactersPresenterProtocol {
    
    var arrayOfCharacters  : [Characters] = []
  var networkManager = NetworkManager()
    var dataLoaded: Bool?
    var controller: CharactersViewControllerProtocol
    
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
                    self.dataLoaded = true
                    self.dataCheck()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func dataCheck () {
       // print (Singleton.shared.arrayOfCharactersObject[1].name)
        if dataLoaded != nil {
            controller.stopLoading()
            controller.collectionViewReloaded()

            
            
            
        }
    }
}

protocol CharactersPresenterProtocol {
    func getArrayOfCharacters ()
}
