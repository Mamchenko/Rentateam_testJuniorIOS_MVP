//
//  NetworkManager.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 15.02.2021.
//

import Foundation

struct NetworkManager {
    
    
      
    
    func getData (complition: @escaping ((PostsResults) ->(Void))) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else {return}
        
        
        DispatchQueue.global(qos: .utility).async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                var result : PostsResults
                if error == nil, let parsData = data {
                    //print ("data \(data)")
                    //print(String(data: parsData, encoding: .utf8))

                    guard let posts = try? JSONDecoder().decode(ApiResponse.self, from: parsData) else {return}
                    result = .success(posts: posts)
                } else {
                    result = .failure(error: error!.localizedDescription)
                }
                    complition(result)
                
                
            }.resume()
        }
    }
    
    func getDataFromStringURL (complition: @escaping (Data) -> (Void) ) {
        for o in Singleton.shared.arrayOfCharactersObject {
            guard let url = URL(string: o.image) else {return}
            
            DispatchQueue.global(qos: .utility).async {
                if let data = try? Data(contentsOf: url) {
                    complition(data)
                }
            }
            
        }
    }
    
}

enum PostsResults {
    case success(posts: ApiResponse)
    case failure(error: String)
}
