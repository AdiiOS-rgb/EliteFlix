//
//  ApiEndPointTV.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 31/10/23.
//

import Foundation

struct TVShowAppend {
    static let schema: String = "https"
    static let host: String = "api.themoviedb.org"
    static let commanPath: String = "3/tv/"
    static let version: String = "3"
}

enum TVShowApiEndPoint: ApiEndPoints { // conform to same protocol as movie protocol
    case topRated(page: Int = 1)
    case popular(page: Int = 1)
    case tVShowDetails(id: Int)
    case tvShowsCast(id: Int)
    case videosById(id: Int)
    case genereList
    
    var host: String {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
            return TVShowAppend.host
        }
    }
    
    var schema: String {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
            return TVShowAppend.schema
        }
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/\(TVConstants.version)/tv/popular"
        case .topRated:
            return "/\(TVConstants.version)/tv/top_rated"
        case .tVShowDetails(let id):
            return "/\(TVConstants.version)/tv/\(id)"
        case .tvShowsCast(let id):
            return "/\(TVConstants.version)/tv/\(id)/credits"
        case  .videosById(let id):
            return "/\(TVConstants.version)/tv/\(id)/videos"
        case .genereList:
            return "/\(TVConstants.version)/genre/tv/list"
        }
    }
    
    var methods: String {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
            return "GET"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .popular(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .topRated(let page):
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        case .tVShowDetails:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .tvShowsCast:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .videosById:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
            
        case .genereList:
            return [URLQueryItem(name: "language", value: String("en-US")),
                    URLQueryItem(name: "api_key", value: Constants.apiKey)]
        }
        
    }
    
    var headers: [(String, String)] {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
//            return [("Content-Type", "application-json")]
            return Constants.AuthorizationToken
        }
    }
    
    var statusCode: Int {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
            return 200
        }
    }
    
    var body: Codable? {
        switch self {
        case .popular, .topRated, .tVShowDetails, .tvShowsCast, .videosById, .genereList:
            return nil
        }
    }
    
}

struct TVConstants {
    static let host: String = "api.themoviedb.org"
    static let imageHost: String = "image.tmdb.org"
    static let version: Int = 3
    static let apiKey: String = "b809a167e006746a56d8d1e9b5b377b7"
    static let readAccessToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWVmY2QxMWFhMzhkYWUyN2VhMWVjNzBhNGNiOTU1YyIsInN1YiI6IjY1MmZjNGI2Y2FlZjJkMDBhZGE4YjI1NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UxzVcoLDKj-ufosM6MESH6sgw46I__t50nXLPVNATrw"
    static let schema: String = "https"
    static let imagePath = "https://image.tmdb.org/t/p/original/"
    static let youtubeBasePath = "https://www.youtube.com/embed/"
}
