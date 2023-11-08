//
//  MovieDetailsEntity.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 03/11/23.
//

import Foundation
struct DetailsEntity {
    let posterImage: String?
    let title: String
    let genres: String
    let votes: String
    let fullStar: Int
    let halfStar: Int
    let releaseDate: String
    let durationEpisodes: String
    let localeSeasons: String
    let releaseDateImage: String
    let durationEpisodesImage: String
    let localeSeasonsImage: String
    let description: String
}

struct MovieAppDetails: Codable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let genres: [Genre]?
    let originalTitle: String?
    let originalName: String?
    let overview: String?
    let releaseDate: String?
    let firstAirDate: String?
    let runtime: Int?
    let languages: [MovieAppLanguage]?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, genres, overview, runtime
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case originalName = "original_name"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case languages = "spoken_languages"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieAppLanguage: Codable {
    let language: String?
    enum CodingKeys: String, CodingKey {
        case language = "english_name"
    }
}

struct MovieAppVideo: Codable {
  let id: Int?
  let results: [MovieAppVideoRecord]?
}
struct MovieAppVideoRecord: Codable {
  let iso639_1, iso3166_1, name, key: String?
  let site: String?
  let size: Int?
  let type: String?
  let official: Bool?
  let publishedAt, id: String?
  enum CodingKeys: String, CodingKey {
    case iso639_1 = "iso_639_1"
    case iso3166_1 = "iso_3166_1"
    case name, key, site, size, type, official
    case publishedAt = "published_at"
    case id
  }
}

struct MovieAppCast: Codable {
    let id: Int?
    let cast: [PersonDetails]?
}
