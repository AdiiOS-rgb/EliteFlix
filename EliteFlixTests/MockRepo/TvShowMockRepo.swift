//
//  TvShowMockRepo.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//

import Foundation
@testable import EliteFlix

class TvShowsRepositoryMock: ITvShowRepo {
    func getTVDetails<T: Codable>(modelType: T.Type, page: Int, _completation completion: @escaping (Result<T, RepoError>) -> Void) {

//        let popularTvShowsResponse = getTopRatedTV()
        
            guard let data = popularTvShowsResponse as? T else {
                return completion(.failure(.invalidData))
            }
            completion(.success(data))
    }
    
    func getDetails<T: Codable>(modelType: T.Type, id: Int, _completation completion: @escaping (Result<T, RepoError>) -> Void) {
        switch modelType {
            case is MovieAppDetails.Type:
                guard let data = tvShowsDetailsResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            case is MovieAppVideo.Type:
                guard let data = tvShowsVideoResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            case is MovieAppCast.Type:
                guard let data = tvShowsCastResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            default: do {
                completion(.failure(.invalidResponse))
            }
        }
    }
    
    func getGenre<T: Codable>(modelType: T.Type, _completation completion: @escaping (Result<T, RepoError>) -> Void) {
        guard let data = tvShowsGenreResponse as? T else {
            return completion(.failure(.invalidResponse))
        }
        completion(.success(data))
    }
    
    
}

