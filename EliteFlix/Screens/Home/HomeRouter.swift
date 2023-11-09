//
//  HomeRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 26/10/23.
//

import Foundation
import UIKit
// protocol HomeRouterProtocol {
////    func switchToMovieModule(type: String, data: [ListObj])
// }

protocol HomePresenterToRouterProtocol {
    var viewController: UIViewController? { get set }
    func navigateToMovie(isNavigate: Bool, data: MovieAppEntity)
}

class HomeRouter: HomePresenterToRouterProtocol {
    var viewController: UIViewController?
    var movieViewController: UINavigationController?
    
    static func createModule() -> UIViewController {
        let router = HomeRouter()
        var presenter: HomePresenterProtocol & HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter(router: router)
        let interactor = HomeInteractor(presenter: presenter)
        let viewController = HomeViewController(presenter: presenter)
        presenter.viewController = viewController
        presenter.interactor = interactor
        router.viewController = viewController
        return viewController
    }
    
    func navigateToMovie(isNavigate: Bool = false, data: MovieAppEntity) {
        if isNavigate {
            viewController?.tabBarController?.selectedIndex = 1
        }
        guard let movieViewController = movieViewController else {
            DispatchQueue.main.async { [weak self] in
                let movieViewController = self?.viewController?.tabBarController?.viewControllers?[1] as? UINavigationController
                self?.movieViewController = movieViewController
                let movieViewControllerProtocol = movieViewController?.visibleViewController as? MoviesPresenterToViewProtocol
                movieViewControllerProtocol?.presenter.configureMovie(movieEntity: data)
            }
            return
        }
        let movieViewControllerProtocol = movieViewController.visibleViewController as? MoviesPresenterToViewProtocol
        movieViewControllerProtocol?.presenter.configureMovie(movieEntity: data)
    }
    
}
