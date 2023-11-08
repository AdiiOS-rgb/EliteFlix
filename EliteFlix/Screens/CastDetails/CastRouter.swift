//
//  CastRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 06/11/23.
//

import UIKit

protocol CastDetailsPresenterToRouterProtocol { }

class CastDetailsRouter: CastDetailsPresenterToRouterProtocol {
    static func build(type: String? = nil, castId: Int? = nil) -> UIViewController {
        let router: CastDetailsPresenterToRouterProtocol = CastDetailsRouter()
        var presenter: CastDetailsPresenterProtocol & CastDetailsViewToPresenterProtocol & CastDetailsInteractorToPresenterProtocol = CastDetailsPresenter(type: type, castId: castId, router: router)
        let interactor = CastDetailsInteractor(presenter: presenter)
        let viewController = CastDetailsViewController(presenter: presenter)
        presenter.viewController = viewController
        presenter.interactor = interactor
        return viewController
    }
}
