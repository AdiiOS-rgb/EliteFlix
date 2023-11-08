//
//  CastDetailsEntity.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 03/11/23.
//

import Foundation
struct PersonDetails: Codable {
    let id: Int?
    let adult: Bool?
    let biography: String?
    let gender: Int?
    let name: String?
    let knownForDepartement: String?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, biography, name, gender
        case knownForDepartement = "known_for_department"
        case profilePath = "profile_path"
    }
}

struct PersonImages: Codable {
    let id: Int?
    let profiles: [PersonImage]?
    
    enum CodingKeys: String, CodingKey {
        case id, profiles
    }
}

struct PersonImage: Codable {
    let filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}

struct MovieAppKnownFor: Codable {
    let id: Int?
    let cast: [MovieAppRecord]?
    let crew: [MovieAppRecord]?
    
    enum CodingKeys: String, CodingKey {
        case id, cast, crew
    }
}

struct MovieAppRecord: Codable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let originalTitle: String?
    let originalName: String?
    let voteAverage: Double?
    let voteCount: Int?
    let genres: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case originalName = "original_name"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genres = "genre_ids"
    }
}

