//
//  MovieMockRepo.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

class MovieRepositoryMock: IMovieAppRepository {
    func get<T: Codable>(type: String, modelType: T.Type, page: Int, completion: @escaping (Result<T, RepoError>) -> Void) {
        switch type {
            case MovieT.Popular:
                guard let data = popularMovieResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            case MovieT.TopRated:
                guard let data = topRatedMovieResponse as? T else {
                    return completion(.failure(.invalidData))
                }
               completion(.success(data))
            case MovieT.UpComing:
                guard let data = upComingMovieResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
                
            case MovieT.NowPlaying:
                guard let data = nowPlayingMovieResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            default: do {
                completion(.failure(.invalidResponse))
            }
        }
    }
    
    func getDetails<T: Codable>(modelType: T.Type, id: Int, completion: @escaping (Result<T, RepoError>) -> Void) {
        switch modelType {
            case is MovieAppDetails.Type:
                guard let data = movieDetailsResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            case is MovieAppVideo.Type:
                guard let data = movieVideoResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            case is MovieAppCast.Type:
                guard let data = movieCastResponse as? T else {
                    return completion(.failure(.invalidData))
                }
                completion(.success(data))
            default: do {
                completion(.failure(.invalidResponse))
            }
        }
    }
    
    func getGenre<T: Codable>(modelType: T.Type, completion: @escaping (Result<T, RepoError>) -> Void) {
        guard let data = movieGenreResponse as? T else {
            return completion(.failure(.invalidResponse))
        }
        completion(.success(data))
    }
    
    
}

