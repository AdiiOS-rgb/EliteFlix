//
//  TVInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol TvInteractorProtocol {
    var presenter: TVPresenterProtocol? {get set}
    var popularTvShowList: PopularTVShowsList? {get set}
    func getTopRatedMovies()
    
//    func convertToCustomModal(list: PopularTVShowsList) -> [CustomModal]
}

class TVInteractor: TvInteractorProtocol {
    var repository: ITvShowRepo?
    var popularTvShowList: PopularTVShowsList?
    var presenter: TVPresenterProtocol?
    
    init(repository: ITvShowRepo? = TVShowsRepository(), popularTvShowList: PopularTVShowsList? = nil, presenter: TVPresenterProtocol? = nil) {
        self.repository = repository
        self.popularTvShowList = popularTvShowList
        self.presenter = presenter
    }
    
    func getTopRatedMovies() {
        repository?.getTVDetails(modelType: PopularTVShowsList.self, page: 1) { result in
            switch result {
            case .success(let data):
                self.popularTvShowList = data
                self.presenter?.fetchedTopRatedMovies()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
//    func convertToCustomModal(list: TopRatedMovies) -> [CustomModal] {
//        var modals : [CustomModal] = []
//        list.list?.forEach({ modal in
//            let customModal = CustomModal(title: modal.originalTitle, img: modal.posterPath, parentModal: modal)
//        })
//        return modals
//    }
    
//    func convertToCustomModal(list: PopularTVShowsList) -> [CustomModal] {
//        var modals: [CustomModal] = []
//        
//        if let moviesList = list.list {
//            for movie in moviesList {
//                if let posterPath = movie.posterPath {
//                    let customModal = CustomModal(title: movie.originalName ?? "", img: posterPath, parentModal: list)
//                    modals.append(customModal)
//                }
//            }
//        }
//        
//        return modals
//    }

}
