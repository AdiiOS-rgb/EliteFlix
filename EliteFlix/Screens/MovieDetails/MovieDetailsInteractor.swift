//
//  MovieDetailsInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailpresenterProtocol? {get set}
    var repository: MovieRepository? {get set}
    
    func fetchMovieDetails<T: Codable>(movieId: Int, modelType: T.Type)
}

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    var presenter: MovieDetailpresenterProtocol?
    var repository: MovieRepository?
    
    init(presenter: MovieDetailpresenterProtocol? = nil, repository: MovieRepository? = MovieRepository()) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func fetchMovieDetails<T: Codable>(movieId: Int, modelType: T.Type) {
        repository?.getDetails(modelType: modelType, id: movieId) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.fetchedMovieDetails(data: data)
                case .failure(let error):
                debugPrint(error.localizedDescription)

            }
        }
    }
}
