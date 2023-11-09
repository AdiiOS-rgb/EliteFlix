//
//  CastMockRepo.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import Foundation
@testable import EliteFlix

class CastRepositoryMock: ICastRepository {
    func getDetails<T>(modelType: T.Type, id: Int, _completation: @escaping (Result<T,EliteFlix.RepoError>) -> Void) where T : Decodable, T : Encodable {
        switch modelType {
        case is PersonDetails.Type:
            guard let data = personDetailsResponse as? T else {
                return _completation(.failure(.invalidData))
            }
            _completation(.success(data))
        case is PersonImages.Type:
            guard let data = personImagesResponse as? T else {
                return _completation(.failure(.invalidData))
            }
            _completation(.success(data))
        default:  do {
            _completation(.failure(.invalidResponse))
        }
        }
    }
    
    func getKnownFor<T>(modelType: T.Type, id: Int, type: String, _completation: @escaping (Result<T, RepoError>) -> Void) where T : Decodable, T : Encodable {
        switch type {
            case String(describing: Movie.self):
                guard let data = movieKnownForResponse as? T else {
                    return _completation(.failure(.invalidData))
                }
            _completation(.success(data))
            case String(describing: TvShows.self):
                guard let data = tvShowsKnownForResponse as? T else {
                    return _completation(.failure(.invalidData))
                }
            _completation(.success(data))
            default:  do {
                _completation(.failure(.invalidResponse))
            }
        }
    }
}
