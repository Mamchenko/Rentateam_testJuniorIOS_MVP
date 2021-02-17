//
//  EnumCaseType.swift
//  RentateamImageView
//
//  Created by Anatoliy Mamchenko on 18.02.2021.
//

import Foundation

enum AnimationDuration {
    case fromLeft
    case fromRright
}

enum PostsResults {
    case success(posts: ApiResponse)
    case failure(error: String)
}


