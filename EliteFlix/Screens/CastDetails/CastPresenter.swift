//
//  CastPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 06/11/23.
//

import Foundation
import UIKit

protocol CastDetailsViewToPresenterProtocol {
    var viewController: CastDetailsPresenterToViewProtocol? { get set }
    func viewDidLoad()
    func fetchCastDetailsById(type: String, castId: Int)
}

protocol CastDetailsInteractorToPresenterProtocol: AnyObject {
    var interactor: CastDetailsPresenterToInteractorProtocol? { get set }
    func onFetchCastDetailsSuccess<T: Codable>(data: T)
    func onFetchKnownForSuccess(data: MovieAppKnownFor)
//    func onFetchError(error: DataError)
    func onFetchKnownForError(error: RepoError)
}

protocol CastDetailsPresenterProtocol {
    var router: CastDetailsPresenterToRouterProtocol { get set }
}

class CastDetailsPresenter: CastDetailsPresenterProtocol, CastDetailsViewToPresenterProtocol, CastDetailsInteractorToPresenterProtocol {
    var castId: Int?
    var type: String?
    private(set) var personDetails: PersonDetails?
    private(set) var personImages: PersonImages?
    private(set) var knownForMovie: MovieAppKnownFor?
    private(set) var knownForTvShows: MovieAppKnownFor?
    private(set) var error: RepoError?
    
    var interactor: CastDetailsPresenterToInteractorProtocol?
    weak var viewController: CastDetailsPresenterToViewProtocol?
    var router: CastDetailsPresenterToRouterProtocol
    
    init(type: String?, castId: Int?, router: CastDetailsPresenterToRouterProtocol) {
        self.type = type
        self.castId = castId
        self.router = router
    }

    func viewDidLoad() {
        guard let castId = castId, let type = type else { return }
        interactor?.fetchCastDetails(castId: castId, modelType: PersonDetails.self)
        interactor?.fetchCastDetails(castId: castId, modelType: PersonImages.self)
        interactor?.fetchKnownFor(castId: castId, type: type)
    }
    
    func fetchCastDetailsById(type: String, castId: Int) {
        self.type = type
        self.castId = castId
        interactor?.fetchCastDetails(castId: castId, modelType: PersonDetails.self)
        interactor?.fetchCastDetails(castId: castId, modelType: PersonImages.self)
        interactor?.fetchKnownFor(castId: castId, type: type)
    }

    func onFetchCastDetailsSuccess<T: Codable>(data: T) {
        switch data {
            case is PersonDetails:
                guard let data = data as? PersonDetails else { return }
                self.personDetails = data
                viewController?.onFetchPersonDetailsSuccess(data: data)
            case is PersonImages:
                guard let data = data as? PersonImages else { return }
                let result = data.profiles?.compactMap({ CustomCollectionViewModel(posterPath: $0.filePath ?? "", title: "") }) ?? []
                viewController?.onFetchPersonPhotosSuccess(data: result)
            default:
                break
        }
    }
    
    func onFetchKnownForSuccess(data: MovieAppKnownFor) {
        let result = data.cast?.compactMap({ CustomCollectionViewModel(posterPath: $0.posterPath ?? "", title: $0.originalName ?? "") }) ?? []
        self.knownForTvShows = data
        viewController?.onFetchKnownForSuccess(data: result)
    }
    
//    func onFetchError(error: DataError) {
//        self.error = error
//        viewController?.onFetchError(error: error)
//    }
    func onFetchKnownForError(error: RepoError) {
        self.error = error
        viewController?.onFetchKnownForError(error: error)
    }
}
