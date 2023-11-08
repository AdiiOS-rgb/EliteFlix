//
//  TVPresenter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

enum TVShowType: CaseIterable {
    case populer
    case topRated
}

protocol TVPresenterProtocol {
    var view: TVviewProtocol? {get set}
    var interactor: TvInteractorProtocol? {get set}
    var router: TvRouterProtocol? {get set}
    func fetchedTopRatedMovies()
    func viewDidLoad()
}

class TVPresenter: TVPresenterProtocol {
    var view: TVviewProtocol?
    var interactor: TvInteractorProtocol?
    var router: TvRouterProtocol?
    
    private var popularTVShowsList: PopularTVShowsList?
    
    init(view: TVviewProtocol? = nil, interactor: TvInteractorProtocol? = nil, router: TvRouterProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.getTopRatedMovies()
    }
    
    func fetchedTopRatedMovies() { // sending to view
        popularTVShowsList = interactor?.popularTvShowList
        view?.fetchedTVshowsList(List: popularTVShowsList?.convertToCustomMod() ?? [], delegate: self)
    }
}

extension TVPresenter: CommanCVToPresenter {
    func selectedItem(indexPath: IndexPath, id: Int?) {
        router?.presentNewVC(indexPath: indexPath, id: id)
    }
}
