//
//  CastRepository.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 06/11/23.
//
protocol ICastRepository {
    func getDetails<T: Codable>(modelType: T.Type, id: Int, _completation: @escaping (Result<T, RepoError>) -> Void)
    func getKnownFor<T: Codable>(modelType: T.Type, id: Int, type: String, _completation: @escaping (Result<T, RepoError>) -> Void)
}

import Foundation
class CastRepository: ICastRepository {
    func getDetails<T: Codable>(modelType: T.Type, id: Int, _completation: @escaping (Result<T, RepoError>) -> Void) {
        var apiEndPoints: CastAPIEnpoints? {
            switch modelType {
                case is PersonDetails.Type: return .personDetails(id: id)
                case is PersonImages.Type: return .personImages(id: id)
                default: return nil
            }
        }
        guard let apiEndPoint = apiEndPoints else {
            return _completation(.failure(.serverError))
        }
        APIManager.shared.request(modelType: modelType, type: apiEndPoint) { responseData in
            switch responseData {
                case .success(let response):
                _completation(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
                    
            }
        }
    }
    
    func getKnownFor<T: Codable>(modelType: T.Type, id: Int, type: String, _completation: @escaping (Result<T, RepoError>) -> Void) {
        var apiEndPoints: CastAPIEnpoints? {
            switch type {
                case String(describing: Movie.self): return .knownMovies(id: id)
                case String(describing: TvShows.self): return .knownTVShows(id: id)
                default: return nil
            }
        }
        guard let apiEndPoint = apiEndPoints else {
            return _completation(.failure(.serverError))
        }
        APIManager.shared.request(modelType: modelType, type: apiEndPoint) { responseData in
            switch responseData {
                case .success(let response):
                _completation(.success(response))
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
