//
//  ApiEnpPointCast.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 04/11/23.
//

import Foundation

enum CastAPIEnpoints: ApiEndPoints {
    
    case personDetails(id: Int)
    case personImages(id: Int)
    case knownMovies(id: Int)
    case knownTVShows(id: Int)
    
    var host: String {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
                return CastConstant.Host
        }
    }
    
    var schema: String {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
                return CastConstant.Schema
        }
    }
    
    var path: String {
        switch self {
            case .personDetails(let id):
                return "/\(Constants.version)/person/\(id)"
            case .knownMovies(let id):
                return  "/\(Constants.version)/person/\(id)/movie_credits"
            case .knownTVShows(let id):
                return "/\(Constants.version)/person/\(id)/tv_credits"
            case .personImages(let id):
                return "/\(Constants.version)/person/\(id)/images"
        }
    }
    
    var methods: String {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
             return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
            case .personDetails:
                return [URLQueryItem(name: "language", value: String("en-US")),
                        URLQueryItem(name: "api_key", value: Constants.apiKey)]
            case .knownMovies:
                return [URLQueryItem(name: "language", value: String("en-US")),
                        URLQueryItem(name: "api_key", value: Constants.apiKey)]
            case .knownTVShows:
                return [URLQueryItem(name: "language", value: String("en-US")),
                        URLQueryItem(name: "api_key", value: Constants.apiKey)]
            case .personImages:
                return [URLQueryItem(name: "language", value: String("en-US")),
                        URLQueryItem(name: "api_key", value: Constants.apiKey)]
        }
    }
    
    var headers: [(String, String)] {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
                return Constants.AuthorizationToken
        }
    }
    
    var statusCode: Int {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
                return Constants.StatusCode
        }
    }
    
    var body: Codable? {
        switch self {
            case .knownTVShows, .knownMovies, .personDetails, .personImages:
                return nil
        }
    }
}

struct CastConstant {
    static let Schema: String = "https"
    static let Host: String = "api.themoviedb.org"
    static let TvCastPath = "\(Version)/tv/"
    static let MovieCastPath = "\(Version)/movie/"
    static let PersonPath = "\(Version)/person/"
    static let Version: Int = 3
}
