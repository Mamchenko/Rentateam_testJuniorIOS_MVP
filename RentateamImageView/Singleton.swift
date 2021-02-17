//
//  Singleton.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 16.02.2021.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    var arrayOfCharactersObject: [Characters] = []
    private init () {}
}

