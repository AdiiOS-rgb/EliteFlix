//
//  TVDetailsPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 02/11/23.
//

import Foundation
import UIKit

protocol TVDetailsPresenterProtocol {
    var view: TVDetailsViewProtocol? {get set}
    var interactor: TVDetailsInteractorProtocol? {get set}
    var router: TVDetailsRouterProtocol? {get set}
    func viewDidLoad()
    func fetchedTVShowDetails<T: Codable>(data: T)
    func fetchTvShowsById(tvShowsId: Int)
    func navigateToCastDetails(indexPath: IndexPath)
}

class TVDetailsPresenter: TVDetailsPresenterProtocol {
    var view: TVDetailsViewProtocol?
    var interactor: TVDetailsInteractorProtocol?
    var router: TVDetailsRouterProtocol?
    var tvShowsId: Int?
//    private var tvShowsDetails: MovieAppDetails?
//    private var tvShowsCast: MovieAppCast?
//    private var tvShowsVideos: MovieAppVideo?
    private(set) var tvShowsDetails: MovieAppDetails?
    private(set) var tvShowsVideo: MovieAppVideo?
    private(set) var tvShowsCast: MovieAppCast?
    private(set) var error: DataError?
    
    init(view: TVDetailsViewProtocol? = nil, interactor: TVDetailsInteractorProtocol? = nil, router: TVDetailsRouterProtocol?, tvShowsId: Int?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.tvShowsId = tvShowsId
    }
    
    func viewDidLoad() {
        guard let tvShowsId = tvShowsId else { return }
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppDetails.self)
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppVideo.self)
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppCast.self)
    }
    
    func fetchTvShowsById(tvShowsId: Int) {
        self.tvShowsId = tvShowsId
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppDetails.self)
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppVideo.self)
        interactor?.fetchTvShowsDetails(tvShowsId: tvShowsId, modelType: MovieAppCast.self)
    }
    
    func fetchedTVShowDetails<T: Codable>(data: T) {
        switch data {
            case is MovieAppDetails:
                guard let data = data as? MovieAppDetails else { return }
                tvShowsDetails = data
                view?.FetchedTVShowList(data: convertToDetailsEntity(data: data))
        case is MovieAppVideo:
            guard let data = data as? MovieAppVideo else { return }
            tvShowsVideo = data
            let response = data.results?.compactMap({ $0.key }) ?? []
            view?.onFetchTvShowsVideosSuccess(data: response)
        case is MovieAppCast:
            guard let data = data as? MovieAppCast else { return }
            tvShowsCast = data
            let response = data.cast?.compactMap({ CustomCollectionViewModel(posterPath: $0.profilePath ?? "", title: $0.name ?? "") }) ?? []
            view?.onFetchTvShowsCastSuccess(data: response)
            default: break
        }
    }
    
    func navigateToCastDetails(indexPath: IndexPath) {
        guard let tvShowsCast = tvShowsCast, let castId = tvShowsCast.cast?[indexPath.row].id else { return }
        router?.navigateToCastDetails(castId: castId)
    }
    
    private func convertToDetailsEntity(data: MovieAppDetails) -> DetailsEntity {
        let genres = data.genres?.compactMap({ $0.name }) ?? []
        let genre = genres.reduce("") { $0.isEmpty ? $1 : $0 + "/ " + $1 }
       
        let votes = "\(data.voteCount ?? 0) votes"
        let average = (data.voteAverage ?? 0) / 2
        let rounded = Int(average.rounded(.down))
        let halfStar = (Double(rounded) != average) ? 1 : 0
        
        return DetailsEntity(posterImage: data.backdropPath, title: data.originalName ?? "", genres: genre, votes: votes, fullStar: rounded, halfStar: halfStar, releaseDate: data.firstAirDate?.convertDateFormat(from: "yyyy-MM-dd", to: "M/d/yy") ?? "", durationEpisodes: "Episodes: \(data.numberOfEpisodes ?? 0)", localeSeasons: "Seasons: \(data.numberOfSeasons ?? 0)", releaseDateImage: "calender", durationEpisodesImage: "tvShows", localeSeasonsImage: "tvShows", description: data.overview ?? "")
    }
}
