//
//  TVDetailsRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 02/11/23.
//

import Foundation
import UIKit

protocol TVDetailsRouterProtocol {
    var viewController: UIViewController? { get set }
    func navigateToCastDetails(castId: Int)
}

class TVDetailsRouter: TVDetailsRouterProtocol {
    var viewController: UIViewController?
    var castDetailsViewController: UIViewController?
    
    static func createModule(tvShowsId: Int? = nil) -> UIViewController {
        let viewController = TVShowDetailsVC()

        var router: TVDetailsRouterProtocol = TVDetailsRouter()
        let interactor: TVDetailsInteractorProtocol = TVDetailInteractor()
        let presenter: TVDetailsPresenterProtocol = TVDetailsPresenter(view: viewController, interactor: interactor, router: router, tvShowsId: tvShowsId)
       
        viewController.presenter = presenter as? TVDetailsPresenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        router.viewController = viewController
    
        return viewController
    }
    
    func navigateToCastDetails(castId: Int) {
      guard let viewController = viewController else { return }
        guard let castDetailsViewController = castDetailsViewController else {
            let castDetailsViewController = CastDetailsRouter.build(type: String(describing: TvShows.self), castId: castId)
            self.castDetailsViewController = castDetailsViewController
            viewController.navigationController?.pushViewController(castDetailsViewController, animated: true)
//            castDetailsViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.resized(to: CGSize(width: 20, height: 20)), style: .done, target: self, action: #selector(backButtontapped(_:)))
//            castDetailsViewController.navigationController?.navigationBar.tintColor = .white
            return
        }
        let castDetailsViewControllerProtocol = castDetailsViewController as? CastDetailsPresenterToViewProtocol
        castDetailsViewControllerProtocol?.presenter.fetchCastDetailsById(type: String(describing: TvShows.self), castId: castId)
        viewController.navigationController?.pushViewController(castDetailsViewController, animated: true)
    }
    
    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
