//
//  CastInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 06/11/23.
//

import Foundation

protocol CastDetailsPresenterToInteractorProtocol {
    var presenter: CastDetailsInteractorToPresenterProtocol? { get set }
    func fetchCastDetails<T: Codable>(castId: Int, modelType: T.Type)
    func fetchKnownFor(castId: Int, type: String)
}

class CastDetailsInteractor: CastDetailsPresenterToInteractorProtocol {
    private var castRepository: ICastRepository
    weak var presenter: CastDetailsInteractorToPresenterProtocol?
    
    init(castRepository: ICastRepository = CastRepository(), presenter: CastDetailsInteractorToPresenterProtocol?) {
        self.castRepository = castRepository
        self.presenter = presenter
    }
    
    func fetchCastDetails<T: Codable>(castId: Int, modelType: T.Type) {
        castRepository.getDetails(modelType: modelType, id: castId) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.onFetchCastDetailsSuccess(data: data)
                case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchKnownFor(castId: Int, type: String) {
        castRepository.getKnownFor(modelType: MovieAppKnownFor.self, id: castId, type: type) { [weak self] response in
            switch response {
                case .success(let data):
                    self?.presenter?.onFetchKnownForSuccess(data: data)
                case .failure(let error):
//                debugPrint(error.localizedDescription)
                self?.presenter?.onFetchKnownForError(error: error)
            }
        }
    }
}
