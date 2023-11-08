//
//  TopRatedModel.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 20/10/23.
//

import Foundation

struct Movie: Codable {
    let id: Int?
    let adult: Bool?
    let backdropPath: URL?
    let genres: [Genre]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: URL?
    let releaseDate: String?
    let status: String?
    let title: String?
    let runtime: Int?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, genres, overview, popularity, status, title, runtime
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
        
}

struct TvShows {
    static let Popular = "TvShowsPopular"
    static let TopRated = "TvShowsTopRated"
}

struct MovieList: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
//    func toListObj() -> [ListObj] {
//        return self.list?.map({ movie in
//            return ListObj(id: movie.id, title: movie.originalTitle,
//                           posterPath: movie.posterPath, backdropPath: movie.backdropPath,
//                           genre: movie.genre, voteAverage: movie.voteAvarage,
//                           voteCount: movie.voteCount)
//                           
//        }) ?? []
//    }
}

struct MovieListObj: Codable {
    let id: Int?
    let backdropPath: URL?
    let posterPath: URL?
    let originalTitle: String?
    let voteAvarage: Double?
    let voteCount: Int?
    let genre: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case voteCount = "vote_count"
        case voteAvarage = "vote_average"
        case genre = "genre_ids"
    }
}

struct PopularMovies: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
    
}

struct TopRatedMovies: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
}

struct UpcomingMovies: Codable {
    let dates: Dates
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
}

struct NowPlayingMovies: Codable {
    let dates: Dates
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [MovieListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
}

//struct MovieGenreList: Codable {
//    let genres: [Genre]
//}



struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - TV Shows List
struct TVShow: Codable {
    let id: Int?
    let adult: Bool?
    let name: String?
    let backdropPath: String?
    let posterPath: String?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]?
    let inProducation: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: Episode?
    let nextEpisodeToAir: Episode?
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originalLanguage: String?
    let overview: String?
    let originalName: String?
    let popularity: Double?
    let seasons: [Season]?
    let voteAverage: Double?
    let voteCount: Int?
    let status: String?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, adult, genres, languages, name, overview, popularity, seasons, status, type
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case inProducation = "in_production"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case nextEpisodeToAir = "next_episode_to_air"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalName = "original_name"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Episode: Codable {
    let id: Int?
    let showId: Int?
    let seasonNumber: Int?
    let episodeNumber: Int?
    let name: String?
    let overview: String?
    let runtime: Int?
    let voteAverage: Double?
    let voteCount: Int?
    let airDate: String?
    let episodeType: String?
    let stillPath: String?

    enum CodingKeys: String, CodingKey {
        case id, name, overview, runtime
        case showId = "show_id"
        case seasonNumber = "season_number"
        case episodeNumber = "episode_number"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case airDate = "air_date"
        case episodeType = "episode_type"
        case stillPath = "still_path"
    }
}

struct Season: Codable {
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let airDate: String?
    let episodeCount: Int?
    let seasonNumber: Int?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
        case airDate = "air_date"
        case seasonNumber = "season_number"
        case episodeCount = "episode_count"
        case voteAverage = "vote_average"
        
    }
}

struct TVShowList: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [TVShowListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
    func toListObj() -> [ListObj] {
        return self.list?.map({ show in
            return ListObj(id: show.id, title: show.originalName,
                           posterPath: show.posterPath, backdropPath: show.backdropPath,
                           genre: show.genre, voteAverage: show.voteAverage,
                           voteCount: show.voteCount)
        }) ?? []
    }
}

struct TVShowListObj: Codable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let originalName: String?
    let genre: [Int]?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case originalName = "original_name"
        case genre = "genre_ids"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct PopularTVShowsList: Codable { //remove
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [TVShowListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
    }
    
    // mapping of current obj to new custom object to get data as desired it return array of customobj
    func convertToCustomMod() -> [CustomObj] {
        return self.list?.map({inst in
            return CustomObj(id: inst.id, title: inst.originalName, posterPath: inst.posterPath, backdropPath: inst.backdropPath)
        }) ?? [] // otherwise return empty array
    }
}

struct TopRatedTVShowsList: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let list: [TVShowListObj]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case list = "results"
        
    }
}

// struct CustomModal {
//    let title : String?
//    let img: String?
//    let parentModal: Any
//    
// }
// let topRatedTVShowsList = TopRatedTVShowsList()

//
// let topRatedTVShowsList = PopularTVShowsList(page: 1, totalPages: 10, totalResults: 100, list: [TVShowListObj]())
// let customModal = [CustomModal(title: "", img: "", parentModal: topRatedTVShowsList)]


struct CustomObj: Codable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let backdropPath: String?
}
