//
//  MoviesPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol MoviePresenterProtocol {
    var view: MovieViewProtocol? {get set}
    var interactor: MovieInteractorProtocol? {get set}
    var router: MovieRouterProtocol? {get set}
    func viewDidLoad()
    
    func fetchedPopularMovies()
    func navigateToMovieDetails(movieId: Int?)
//    func configureMovie(movieEntity: MovieAppEntity)
    
    func numbersOfItemInSection(section: Int) -> Int
    func ConfigCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

class MoviesPresenter: MoviePresenterProtocol {
    private(set) var movieEntity: MovieAppEntity?
    
    var view: MovieViewProtocol?
    var interactor: MovieInteractorProtocol?
    var router: MovieRouterProtocol?
    
    private var popularMovie: PopularMovies?
    init(view: MovieViewProtocol? = nil, interactor: MovieInteractorProtocol? = nil, router: MovieRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.getPopularMovies()
    }
    
//    func configureMovie(movieEntity: MovieAppEntity) {
//        self.movieEntity = movieEntity
//        switch movieEntity.type {
//            case MovieT.Popular:
//                view?.configure(title: "Popular", data: movieEntity.convertToMoviesCustomCollectionViewModel())
//            case MovieT.TopRated:
//            view?.configure(title: "Top Rated", data: movieEntity.convertToMoviesCustomCollectionViewModel())
//            case MovieT.UpComing:
//            view?.configure(title: "Up Coming", data: movieEntity.convertToMoviesCustomCollectionViewModel())
//            case MovieT.NowPlaying:
//            view?.configure(title: "Now Playing", data: movieEntity.convertToMoviesCustomCollectionViewModel())
//            default: break
//        }
//    }
    
    func fetchedPopularMovies() {
        popularMovie = interactor?.popularMovieList
        view?.fetchedPopularMovie(List: popularMovie)
    // send this to view pending
    }
    
    func numbersOfItemInSection(section: Int) -> Int {
        return popularMovie?.list?.count ?? 10
    }
    
    func ConfigCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVClassCell.Identifier, for: indexPath) as? CVClassCell else {
            return UICollectionViewCell() }
        
        let title = popularMovie?.list?[indexPath.row].originalTitle ?? "MovieName"
        let poster = popularMovie?.list?[indexPath.row].posterPath
        
        if let posterURL = poster {
            let posterString = posterURL.absoluteString
            cell.SetCVCell(title: title, posterPath: posterString)
        } else {
            cell.SetCVCell(title: title, posterPath: "")
        }
        return cell
    }
    
    func navigateToMovieDetails(movieId: Int?) {
        router?.navigateToMovieDetails(movieId: movieId)
    }
}
