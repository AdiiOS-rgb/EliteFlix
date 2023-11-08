//
//  ApiEndPoints.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 25/10/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

protocol ApiEndPoints {
    var host: String { get }
    var schema: String { get}
    var path: String {get}
    var methods: String {get}
    var queryItems: [URLQueryItem] {get}
    var headers: [(String, String)] {get}
    var statusCode: Int {get}
    var body: Codable? {get}
}

enum MovieAPIEndPoints: ApiEndPoints {
    case populer(page: Int = 1)
    case topRated(page: Int = 1)
    case upComing(page: Int = 1)
    case nowPlaying(page: Int = 1)
    case movieDetails(id: Int)
    case videosById(id: Int)
    case movieCast(id: Int)
    case genereList

    var host: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .videosById, .movieCast, .genereList:
            return Constants.host
        }
    }
    
    var schema: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .movieCast, .videosById, .genereList:
            return "https"
        }
    }
    
    var path: String {
        switch self {
        case .populer:
            return "/\(Constants.version)/movie/popular"
        case .topRated:
            return "/\(Constants.version)/movie/top_rated"
        case .upComing:
            return "/\(Constants.version)/movie/upcoming"
        case .nowPlaying:
            return "/\(Constants.version)/movie/now_playing"
        case .movieDetails(let id):
            return "/\(Constants.version)/movie/\(id)"
        case .videosById(let id):
            return "/\(Constants.version)/movie/\(id)/videos"
        case .movieCast(let id):
            return  "/\(Constants.version)/movie/\(id)/credits"
        case .genereList:
            return "/\(Constants.version)/genre/movie/list"
        }
    }
    
    var methods: String {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .movieCast, .videosById, .genereList:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .populer(let page),
             .nowPlaying(let page),
             .topRated(let page),
             .upComing(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .movieDetails:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .videosById:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .movieCast:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .genereList:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        }
    }
    
    var headers: [(String, String)] {
        switch self {
        case .populer, .nowPlaying, .topRated, .upComing, .movieDetails, .movieCast, .videosById, .genereList:
            return [("Content-Type", "application-json")]
        }
    }

    var statusCode: Int {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .movieCast, .videosById, .genereList:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .movieDetails, .nowPlaying, .populer, .topRated, .upComing, .movieCast, .videosById, .genereList:
            return nil
        }
    }
}

struct Constants {
    static let host: String = "api.themoviedb.org"
    static let imageHost: String = "image.tmdb.org"
    static let version: Int = 3
    static let apiKey: String = "b809a167e006746a56d8d1e9b5b377b7"
    static let readAccessToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODA5YTE2N2UwMDY3NDZhNTZkOGQxZTliNWIzNzdiNyIsInN1YiI6IjYzZDM4NzFkZTcyZmU4MDA3Y2E0YWI1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DD6JB6hszBoLbuhcec740ZLa0pcXZwSMkR2JnlKGADA"
    static let schema: String = "https"
    static let imagePath = "https://image.tmdb.org/t/p/original/"
    static let youtubeBasePath = "https://www.youtube.com/embed/"
    static let AuthorizationToken: [(String, String)] = [("Authorization", readAccessToken), ("Content-Type", "application/json")]
    static let StatusCode = 200
}

struct MovieT {
    static let Popular = "MoviePopular"
    static let TopRated = "MovieTopRated"
    static let UpComing = "MovieUpcoming"
    static let NowPlaying = "MovieNowPlaying"
}
