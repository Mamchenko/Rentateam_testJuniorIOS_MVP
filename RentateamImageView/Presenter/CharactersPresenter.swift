//
//  ImageCollectionViewPresenter.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation
import UIKit


class CharactersPresenter: CharactersPresenterProtocol {
    
   private var networkManager = NetworkManager()
    weak var controller: CharactersViewControllerProtocol?
   private var database = DatabaseManager()
    
    init (controller: CharactersViewControllerProtocol? ) {
        self.controller = controller
    }
    
    var getCharactersData: Bool = false
    private let imageManager: DateAndImageManager = DateAndImageManager()
    
    func getImageAndDate(by urlStr: String, handler: @escaping (UIImage, Date) -> ()) {
        imageManager.getObject(urlStr) { (image, date) in
            handler(image, date)
        }
    }
    
    func getArrayOfCharacters () {
        controller?.startLoading()
        networkManager.getData { [weak self] (result) -> (Void) in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    Singleton.shared.arrayOfCharactersObject = posts.results
                    self?.dataCheck()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func dataCheck () {
        controller?.stopLoading()
        controller?.collectionViewReloaded()
    }
}


