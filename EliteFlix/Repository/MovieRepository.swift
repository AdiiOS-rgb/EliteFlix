//
//  MovieRepository.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 25/10/23.
//

import Foundation

protocol IMovieAppRepository { // for test
    func get<T: Codable>(type: String, modelType: T.Type, page: Int, completion: @escaping (Result<T, RepoError>) -> Void)
    func getDetails<T: Codable>(modelType: T.Type, id: Int, completion: @escaping (Result<T, RepoError>) -> Void)
    func getGenre<T: Codable>(modelType: T.Type, completion: @escaping (Result<T, RepoError>) -> Void)
}

enum MovieRepositoryError: String, Error {
    case serverError = "Error from server"
}

class MovieRepository: IMovieAppRepository {
    
//    func get<T: Codable>(
//        modelType: T.Type,
//        page: Int = 1,
//        _completation: @escaping (Result<T, MovieRepositoryError>) -> Void) {
//            
//        var apiEndPoint: MovieAPIEndPoints? {
//            switch modelType {
//            case is PopularMovies.Type: return .populer(page: page)
//            case is TopRatedMovies.Type: return .topRated(page: page)
//            case is UpcomingMovies.Type: return .upComing(page: page)
//            case is NowPlayingMovies.Type: return .nowPlaying(page: page)
//            default: return  nil
//            }
//        }
////        var apiEndPoint: MovieAPIEndPoints? {
////            switch modelType {
////                case MovieT.Popular: return .populer(page: page)
////                case MovieT.TopRated: return .topRated(page: page)
////                case Movie.UpComing: return .upComing(page: page)
////                case Movie.NowPlaying: return .nowPlaying(page: page)
////                default: return  nil
////            }
////        }
//        
//        guard let apiEnd = apiEndPoint else {
//            return _completation(.failure(.serverError))
//        }
//        
//        APIManager.shared.request(modelType: modelType, type: apiEnd) { result in
//            switch result {
//            case .success(let data):
//                
//                _completation(.success(data))
//            case .failure(let error):
//                debugPrint(error)
//                _completation(.failure(.serverError))
//            }
//        }
//    }
    
    func get<T: Codable>(type: String, modelType: T.Type, page: Int = 1, completion: @escaping (Result<T, RepoError>) -> Void) {
        var apiEndPoints: MovieAPIEndPoints? {
            switch type {
                case MovieT.Popular: return .populer(page: page)
                case MovieT.TopRated: return .topRated(page: page)
                case MovieT.UpComing: return .upComing(page: page)
                case MovieT.NowPlaying: return .nowPlaying(page: page)
                default: return  nil
            }
        }
        guard let apiEndPoint = apiEndPoints else {
            return completion(.failure(.serverError))
        }
        APIManager.shared.request(modelType: modelType, type: apiEndPoint) { responseData in
            switch responseData {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
//                    completion(.failure(.serverError))
            }
        }
    }
    func getDetails<T: Codable>(modelType: T.Type, id: Int, completion _completation: @escaping (Result<T, RepoError>) -> Void) {
        var apiEndPoints: MovieAPIEndPoints? {
            switch modelType {
                case is MovieAppDetails.Type: return .movieDetails(id: id)
                case is MovieAppVideo.Type: return .videosById(id: id)
                case is MovieAppCast.Type: return .movieCast(id: id)
                default: return  nil
            }
        }
        guard let apiEndPoint = apiEndPoints else {
            return _completation(.failure(.serverError))
        }
        APIManager.shared.request(modelType: modelType, type: apiEndPoint) { respoonseData in
            switch respoonseData {
                case .success(let response):
                _completation(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
                _completation(.failure(.serverError))
            }
        }
    }
    
    func getGenre<T: Codable>(modelType: T.Type, completion _completation: @escaping (Result<T, RepoError>) -> Void) {
        APIManager.shared.request(modelType: modelType, type: MovieAPIEndPoints.genereList ) { respoonseData in
            switch respoonseData {
                case .success(let response):
                _completation(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
//                _completation(.failure(.serverError))
            }
        }
    }
}
