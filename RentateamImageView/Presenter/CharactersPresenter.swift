//
//  ImageCollectionViewPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation


class CharactersPresenter: CharactersPresenterProtocol {
    
  var networkManager = NetworkManager()
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
                    self.dataCheck()
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
}
