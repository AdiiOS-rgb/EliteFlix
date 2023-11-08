//
//  MoviesInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol MovieInteractorProtocol {
    var presenter: MoviePresenterProtocol? {get set}
    var repository: MovieRepository? {get set}
    var popularMovieList: PopularMovies? {get set}
    
    func getPopularMovies()
}

class MoviesInteractor: MovieInteractorProtocol {
    var repository: MovieRepository?
    var popularMovieList: PopularMovies?
    var presenter: MoviePresenterProtocol?
    
    init(repository: MovieRepository? = MovieRepository(), popularMovieList: PopularMovies? = nil, presenter: MoviePresenterProtocol? = nil) {
        self.repository = repository
        self.popularMovieList = popularMovieList
        self.presenter = presenter
    }
    
    func getPopularMovies() {
        repository?.get(modelType: PopularMovies.self, _completation: { result in
            switch result {
            case .success(let data):
                self.popularMovieList = data
                self.presenter?.fetchedPopularMovies()
            case .failure: break
//                self.presenter?.onFetchPopularMovieListFailure()
            }
        })
    }
    
}
