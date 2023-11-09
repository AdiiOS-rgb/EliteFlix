//
//  TVShowsRepository.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 31/10/23.
//

import Foundation

protocol ITvShowRepo { // for test
    func getTVDetails<T: Codable>(modelType: T.Type, page: Int, _completation: @escaping (Result<T, RepoError>) -> Void)
    func getDetails<T: Codable>(modelType: T.Type, id: Int, _completation: @escaping (Result<T, RepoError>) -> Void)
    func getGenre<T: Codable>(modelType: T.Type, _completation: @escaping (Result<T, RepoError>) -> Void)
}

class TVShowsRepository: ITvShowRepo {
    func getTVDetails<T: Codable>( modelType: T.Type, page: Int = 1, _completation: @escaping (Result<T, RepoError>) -> Void) {
        
        var apiEndPoint: TVShowApiEndPoint? {
            switch modelType {
            case is PopularTVShowsList.Type: return .popular(page: page)
            case is TopRatedTVShowsList.Type: return .topRated(page: page)
            default: return  nil
            }
        }
        
        guard let apiEnd = apiEndPoint else {
            return _completation(.failure(.serverError))
        }
        
        APIManager.shared.request(modelType: modelType, type: apiEnd) { result in
            switch result {
            case .success(let data):
                _completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                _completation(.failure(.serverError))
            }
        }
    }
    
    func getDetails<T: Codable>(modelType: T.Type, id: Int, _completation completion: @escaping (Result<T, RepoError>) -> Void) {
        var apiEndPoints: TVShowApiEndPoint? {
            switch modelType {
            case is MovieAppDetails.Type: return .tVShowDetails(id: id)
            case is MovieAppVideo.Type: return .videosById(id: id)
            case is MovieAppCast.Type: return .tvShowsCast(id: id)
            default: return  nil
            }
        }
        guard let apiEndPoint = apiEndPoints else {
            return completion(.failure(.serverError))
        }
        APIManager.shared.request(modelType: modelType, type: apiEndPoint) { respoonseData in
            switch respoonseData {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(.serverError))
            }
        }
    }
    
    func getGenre<T: Codable>(modelType: T.Type, _completation completion: @escaping (Result<T, RepoError>) -> Void) {
        APIManager.shared.request(modelType: modelType, type: TVShowApiEndPoint.genereList) { respoonseData in
            switch respoonseData {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
}

enum RepoError: Error {
    case serverError 
    case badUrl
    case invalidResponse
    case invalidData
    case encodeError(Error)
    case decodeError(Error)
}
