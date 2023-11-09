//
//  MoviesPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol MoviesViewToPresenterProtocol {
    var viewController: MoviesPresenterToViewProtocol? { get set }
    func navigateToMovieDetails(type: String?, indexPath: IndexPath)
    func viewDidLoad()
    func configureMovie(movieEntity: MovieAppEntity)
}

protocol MoviesInteractorToPresenterProtocol {
    var interactor: MoviesPresenterToInteractorProtocol? { get set }
}

protocol MoviesPresenterProtocol {
    var router: MoviesPresenterToRouterProtocol { get set }
}

class MoviesPresenter: MoviesPresenterProtocol, MoviesViewToPresenterProtocol, MoviesInteractorToPresenterProtocol {
    private(set) var movieEntity: MovieAppEntity?
    
    var interactor: MoviesPresenterToInteractorProtocol?
    weak var viewController: MoviesPresenterToViewProtocol?
    var router: MoviesPresenterToRouterProtocol
    
    init(router: MoviesPresenterToRouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {}
    
    func configureMovie(movieEntity: MovieAppEntity) {
        self.movieEntity = movieEntity
        switch movieEntity.type {
            case MovieT.Popular:
                viewController?.configure(title: "Popular", data: movieEntity.convertToMoviesCustomCollectionViewModel())
            case MovieT.TopRated:
                viewController?.configure(title: "Top Rated", data: movieEntity.convertToMoviesCustomCollectionViewModel())
            case MovieT.UpComing:
                viewController?.configure(title: "Up Coming", data: movieEntity.convertToMoviesCustomCollectionViewModel())
            case MovieT.NowPlaying:
                viewController?.configure(title: "Now Playing", data: movieEntity.convertToMoviesCustomCollectionViewModel())
            default: break
        }
    }
}

extension MoviesPresenter {
    func navigateToMovieDetails(type: String?, indexPath: IndexPath) {
        guard let movieId = movieEntity?.data?.results?[indexPath.row].id else { return }
        router.navigateToMovieDetails(movieId: movieId)
    }
}
