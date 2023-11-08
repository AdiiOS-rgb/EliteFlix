//
//  HomeEntity.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 26/10/23.
//

import Foundation

struct GenreList: Codable {
    let list: [Genre]
}

struct MovieData {
    let type: MovieType
    var data: [ListObj]
}

struct TVShowData {
    let type: TVShowType
    var data: [ListObj]
}

struct TableHeaderInput {
    let title: String
    let poster: String
    let votes: String
    let fullStar: Int
    let halfStar: Int
    let genreList: [Genre]
}

struct ListObj: Codable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let backdropPath: String?
    let genre: [Int]?
    let voteAverage: Double?
    let voteCount: Int?
}

enum MovieType: CaseIterable {
    case populer
    case topRated
    case upcoming
    case nowPlaying
}

enum DataType: CaseIterable {
    case popularMovies
    case topRatedMovies
    case upcomingMovies
    case nowPlayingMovies
    case popularTVShows
    case topRatedTVShows
}

struct HomeHeaderViewData {
    let posterPath: String
    let title: String
    let votes: String
    let fullStar: Int
    let halfStar: Int
}

struct MovieAppEntity {
    let type: String
    let data: MovieAppModel?
    
    func convertToMoviesCustomCollectionViewModel() -> [CustomCollectionViewModel] {
        return data?.results?.compactMap({ CustomCollectionViewModel(posterPath: $0.posterPath ?? "", title: $0.originalTitle ?? "") }) ?? []
    }
    
    func convertToTvShowsCustomCollectionViewModel() -> [CustomCollectionViewModel] {
        return data?.results?.compactMap({ CustomCollectionViewModel(posterPath: $0.posterPath ?? "", title: $0.originalName ?? "") }) ?? []
    }
}

struct MovieAppModel: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    var results: [MovieAppRecord]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
}

struct MovieAppGenre: Codable {
    let genres: [Genre]?
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}
struct HomeGenreMapping {
    let type: HomeHeaderViewButtonType
    let id: Int
}
