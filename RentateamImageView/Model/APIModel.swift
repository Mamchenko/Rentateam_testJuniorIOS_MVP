//
//  APIModel.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation

//struct Char: Decodable {
//    let info: Info
//    let results: [Result]
//}

// MARK: - Info
//struct Info: Decodable {
//    let count: Int
//    let pages: Int
//    let next: String
//    let prev: String?
//}

// MARK: - Result
struct Result: Decodable {
    let id: Int
    let name: String
//    let status: Status
//    let species: Species
//    let type: String
//    let gender: Gender
//    let origin: Origin
//    let location: Location
    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
}

// MARK: - Location
//struct Location: Decodable {
//    let name: String
//    let url: String
//}

// MARK: - Origin
//struct Origin: Decodable {
//    let name: String
//    let url: String
//}
//
//enum Gender: String, Decodable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "unknown"
//}
//
//
//
//enum Species: String, Decodable {
//    case alien = "Alien"
//    case human = "Human"
//}
//
//enum Status: String, Decodable {
//    case alive = "Alive"
//    case dead = "Dead"
//    case unknown = "unknown"
//}
