//
//  TVRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol TvRouterProtocol {
    func presentNewVC(indexPath: IndexPath?, id: Int?)
    var viewController: UINavigationController? { get set }
}

class TVRouter: TvRouterProtocol {
    var viewController: UINavigationController?
    var tvShowsDetailsViewController: UIViewController?
    var TVShowDetailsVC: UIViewController?

    
    static func createModule() -> UINavigationController {
        
        let viewController = TvShowsViewController()

        var router: TvRouterProtocol = TVRouter()
        let interactor: TvInteractorProtocol = TVInteractor()
        let presenter: TVPresenterProtocol = TVPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter as? TVPresenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.presenter?.router?.viewController = navigationController
        return navigationController
    }
    
    func presentNewVC(indexPath: IndexPath?, id: Int?) {

        guard let viewController = viewController else { return }
        guard let tvShowsDetailsViewController = tvShowsDetailsViewController else {
            let tvShowsDetailsViewController = TVDetailsRouter.createModule(tvShowsId: id)
                self.tvShowsDetailsViewController = tvShowsDetailsViewController
            viewController.pushViewController(tvShowsDetailsViewController, animated: true)
            return
        }
        let tvShowsDetailsViewControllerProtocol = tvShowsDetailsViewController as? TVDetailsViewProtocol
        tvShowsDetailsViewControllerProtocol?.presenter?.fetchTvShowsById(tvShowsId: id!)
        viewController.pushViewController(tvShowsDetailsViewController, animated: true)
        viewController.isNavigationBarHidden = false
        
    }
}
