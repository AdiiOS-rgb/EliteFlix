//
//  TVDetailInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 02/11/23.
//

import Foundation

protocol TVDetailsInteractorProtocol {
    var presenter: TVDetailsPresenterProtocol? {get set}
    func fetchTvShowsDetails<T: Codable>(tvShowsId: Int, modelType: T.Type)
}

class TVDetailInteractor: TVDetailsInteractorProtocol {
    var repository: ITvShowRepo?
    var presenter: TVDetailsPresenterProtocol?
    
    init(repository: ITvShowRepo? = TVShowsRepository(), presenter: TVDetailsPresenterProtocol? = nil) {
        self.repository = repository
        self.presenter = presenter
    }
    
    func fetchTvShowsDetails<T: Codable>(tvShowsId: Int, modelType: T.Type) {
        repository?.getDetails(modelType: modelType, id: tvShowsId) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.fetchedTVShowDetails(data: data)
                case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
