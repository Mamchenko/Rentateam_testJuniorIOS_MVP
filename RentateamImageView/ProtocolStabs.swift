//
//  ProtocolStabs.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 18.02.2021.
//

import Foundation
import UIKit

protocol CharactersPresenterProtocol {
    func getArrayOfCharacters ()
    func getImageAndDate(by urlStr: String, handler: @escaping (UIImage, Date) -> ())
}

protocol InfoViewControllerPresenterProtocol {
    func getImageAndData(by urlStr: String, handler: @escaping (UIImage, Date) -> ())
}

protocol CharactersViewControllerProtocol: class {
    func startLoading ()
    func stopLoading ()
    func collectionViewReloaded ()
}

protocol InfoViewControllerProtocol: class {
}
