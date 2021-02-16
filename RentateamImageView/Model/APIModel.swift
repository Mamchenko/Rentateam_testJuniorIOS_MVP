//
//  APIModel.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation

struct ApiResponse: Codable {
   
    let results: [Characters]
}

struct Characters: Codable {
    var name: String
    var image: String
    
}
 
