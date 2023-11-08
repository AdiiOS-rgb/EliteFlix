//
//  HomeInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 26/10/23.
//

import Foundation

protocol HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchMovies(type: String)
    func fetchGenre()
}

class HomeInteractor: HomePresenterToInteractorProtocol {
    private var movieRepository: IMovieAppRepository
    weak var presenter: HomeInteractorToPresenterProtocol?
   
    init(movieRepository: IMovieAppRepository = MovieRepository(), presenter: HomeInteractorToPresenterProtocol?) {
        self.movieRepository = movieRepository
        self.presenter = presenter
    }
    
    func fetchMovies(type: String) {
        movieRepository.get(type: type, modelType: MovieAppModel.self, page: 1) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.onFetchMoviesSuccess(type: type, data: data)
                case .failure(let error):
                debugPrint(error.localizedDescription)
//                    self?.presenter?.onFetchMoviesError(type: type, error: error)
            }
        }
    }
    
    func fetchGenre() {
        movieRepository.getGenre(modelType: MovieAppGenre.self) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.onFetchGenreSuccess(data: data)
                case .failure(let error):
                debugPrint(error.localizedDescription)
//                    self?.presenter?.onFetchGenreError(error: error)
            }
        }
    }
}
