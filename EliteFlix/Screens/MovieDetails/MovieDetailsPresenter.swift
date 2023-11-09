//
//  MovieDetailsPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

protocol MovieDetailpresenterProtocol {
    var view: MovieDetailViewProtocol? {get set}
    var interactor: MovieDetailsInteractorProtocol? {get set}
    var router: MovieDetailsRouterProtocol? {get set}
    
    func fetchMovieById(Movieid: Int)
    func fetchedMovieDetails<T: Codable>(data: T)
    func viewDidLoad()
    func navigateToCastDetails(indexPath: IndexPath)
}

class MovieDetailsPresenter: MovieDetailpresenterProtocol {

    func navigateToCastDetails(indexPath: IndexPath) {
        guard let movieCast = movieCast, let castId = movieCast.cast?[indexPath.row].id else { return }
        router?.navigateToCastDetails(castId: castId)
    }
    
    var view: MovieDetailViewProtocol?
    var interactor: MovieDetailsInteractorProtocol?
    var router: MovieDetailsRouterProtocol?
    var Movieid: Int?
//    private var movieVidoes: MovieAppVideo?
//    private var movieDetails: MovieAppDetails?
//    private var movieCast: MovieAppCast?
    
    private(set) var movieDetails: MovieAppDetails?
    private(set) var movieVideo: MovieAppVideo?
    private(set) var movieCast: MovieAppCast?
    private(set) var error: RepoError?
    
    init(view: MovieDetailViewProtocol? = nil, interactor: MovieDetailsInteractorProtocol? = nil, router: MovieDetailsRouterProtocol? = nil, Movieid: Int? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.Movieid = Movieid
    }
//    init(router: MovieDetailsRouterProtocol? = nil, Movieid: Int? = nil) {
//        self.router = router
//        self.Movieid = Movieid
//    }
    
    func viewDidLoad() {
        guard let Movieid = Movieid else {
            return
        }
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppDetails.self)
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppVideo.self)
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppCast.self)
    }
    
    func fetchMovieById(Movieid: Int) { // coming
        self.Movieid = Movieid
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppDetails.self)
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppVideo.self)
        interactor?.fetchMovieDetails(movieId: Movieid, modelType: MovieAppCast.self)
    }
    
    func fetchedMovieDetails<T: Codable>(data: T) {
        switch data {
            case is MovieAppDetails:
                guard let data = data as? MovieAppDetails else { return }
                movieDetails = data
                view?.fetchedMovieDetails(data: convertToDetailsEntity(data: data))
            case is MovieAppVideo:
                guard let data = data as? MovieAppVideo else { return }
                movieVideo = data
                let result = data.results?.compactMap({ $0.key }) ?? []
                view?.fetchedYTVideo(data: result)
            
        case is MovieAppCast:
            guard let data = data as? MovieAppCast else { return }
            movieCast = data
            let result = data.cast?.compactMap({ CustomCollectionViewModel(posterPath: $0.profilePath ?? "", title: $0.name ?? "") }) ?? []
            view?.fetchedCastDetails(data: result)
            default: break
        }
        
         func convertToDetailsEntity(data: MovieAppDetails) -> DetailsEntity {
            let genres = data.genres?.compactMap({ $0.name }) ?? []
            let genre = genres.reduce("") { $0.isEmpty ? $1 : $0 + "/ " + $1 }
            
            let hours = (data.runtime ?? 60) / 60
            let minutes = (data.runtime ?? 30) % 60
            let votes = "\(data.voteCount ?? 0) votes"
            
            var duration = String(format: "%02d:%02d", hours, minutes)
            duration.append(" \(data.runtime ?? 90) min")
            
            let average = (data.voteAverage ?? 0) / 2
            let rounded = Int(average.rounded(.down))
            let halfStar = (Double(rounded) != average) ? 1 : 0

            return DetailsEntity(posterImage: data.backdropPath, title: data.originalTitle ?? "No title", genres: genre, votes: votes, fullStar: rounded, halfStar: halfStar, releaseDate: data.releaseDate?.convertDateFormat(from: "yyyy-MM-dd", to: "M/d/yy") ?? "", durationEpisodes: duration, localeSeasons: data.languages?.first?.language ?? "No language", releaseDateImage: "calender", durationEpisodesImage: "time", localeSeasonsImage: "earth", description: data.overview ?? "No overview")
        }
    }  
}
