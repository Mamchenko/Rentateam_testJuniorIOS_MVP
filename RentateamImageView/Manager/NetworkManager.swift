//
//  NetworkManager.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation

struct NetworkManager {
    let urlString = "https://rickandmortyapi.com/api/character"
    
    func getData (complition: @escaping ((PostsResults) ->(Void))) {
        guard let url = URL(string: urlString) else {return}
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result : PostsResults
                if error == nil, let parsData = data {
                    guard let posts = try? JSONDecoder().decode(ApiResponse.self, from: parsData) else {return}
                    result = .success(posts: posts)
                } else {
                    result = .failure(error: error!.localizedDescription)
                }
                complition(result)
                
                
            }.resume()
        }
    }
    
    func getImageData(by urlStr: String, complition: @escaping (Data) -> (Void) ) {
        guard let url = URL(string: urlStr) else {return}
        if let data = try? Data(contentsOf: url) {
            complition(data)
        }
    }
}

