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
//    func navigateToMovie(isNavigate: Bool = false, data: MovieAppEntity) {
//        if isNavigate {
//            viewController?.tabBarController?.selectedIndex = 1
//        }
//        guard let movieViewController = movieViewController else {
//            DispatchQueue.main.async { [weak self] in
//                let movieViewController = self?.viewController?.tabBarController?.viewControllers?[1] as? UINavigationController
//                self?.movieViewController = movieViewController
//                let movieViewControllerProtocol = movieViewController?.visibleViewController as? MovieViewProtocol
//                movieViewControllerProtocol?.presenter?.configureMovie(movieEntity: data)
//            }
//            return
//        }
//        let movieViewControllerProtocol = movieViewController.visibleViewController as? MovieViewProtocol
//        movieViewControllerProtocol?.presenter?.configureMovie(movieEntity: data)
//    }
    
}
// class HomeRouter: HomeRouterProtocol {
//    var movieViewController: UINavigationController?
//    static func createModule() -> UINavigationController {
//        let viewController = HomeViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        
//        let router: HomeRouterProtocol = HomeRouter()
//        let interactor: HomeInteractorProtocol = HomeInteractor()
//        let presenter: HomePresenterProtocol = HomePresenter(view: viewController, router: router, interactor: interactor)
//        
//        viewController.presenter = presenter as? HomePresenter
//        viewController.presenter?.router = router
//        viewController.presenter?.interactor = interactor
//        viewController.presenter?.interactor?.presenter = presenter
//        
//    
//        return navigationController
//    }
    
//    func switchToMovieModule(type: String, data: [ListObj]) {
//        
//        guard let movieViewController = movieViewController else {
//              DispatchQueue.main.async { [weak self] in
//                let movieViewController = self?.viewController?.tabBarController?.viewControllers?[1]
//                                          as? UINavigationController
//                self?.movieViewController = movieViewController
//                let movieViewInterFace = movieViewController?.visibleViewController as? MovieViewInterface
//                  movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
//              }
//              return
//            }
//        let movieViewInterFace = movieViewController.visibleViewController as? HomeViewProtocol
//        movieViewInterFace?.presenter?.configerMovies(type: type, data: data)
//        viewController?.tabBarController?.selectedIndex = 1
//    }
