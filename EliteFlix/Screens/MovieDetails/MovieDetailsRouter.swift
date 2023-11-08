//
//  MovieDetailsRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

protocol MovieDetailsRouterProtocol {
    var viewController: UIViewController? { get set }
    func navigateToCastDetails(castId: Int)
}

class MovieDetailsRouter: MovieDetailsRouterProtocol {
    var viewController: UIViewController?
    var castDetailsViewController: UIViewController?
    
    static func createModule(Movieid: Int? = nil) -> UIViewController {
        let viewController = MovieDetailController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        var router: MovieDetailsRouterProtocol = MovieDetailsRouter()
        let interactor: MovieDetailsInteractorProtocol = MovieDetailsInteractor()
        let presenter: MovieDetailpresenterProtocol = MovieDetailsPresenter(view: viewController, interactor: interactor, router: router, Movieid: Movieid)
       
        viewController.presenter = presenter as? MovieDetailsPresenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        router.viewController = viewController
    
        return viewController
    }
    func navigateToCastDetails(castId: Int) {
        guard let viewController = viewController else { return }
        guard let castDetailsViewController = castDetailsViewController else {
            let castDetailsViewController = CastDetailsRouter.build(type: String(describing: Movie.self), castId: castId)
            self.castDetailsViewController = castDetailsViewController
            viewController.navigationController?.pushViewController(castDetailsViewController, animated: true)
//            castDetailsViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.resized(to: CGSize(width: 20, height: 20)), style: .done, target: self, action: #selector(backButtontapped(_:)))
//            castDetailsViewController.navigationController?.navigationBar.tintColor = .white
            return
        }
        let castDetailsViewControllerProtocol = castDetailsViewController as? CastDetailsPresenterToViewProtocol
        castDetailsViewControllerProtocol?.presenter.fetchCastDetailsById(type: String(describing: Movie.self), castId: castId)
        viewController.navigationController?.pushViewController(castDetailsViewController, animated: true)
    }

    @objc private func backButtontapped(_ sender: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
