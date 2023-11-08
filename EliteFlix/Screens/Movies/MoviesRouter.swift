//
//  MoviesRouter.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol MovieRouterProtocol {
    var viewController: UINavigationController? { get set }
    func navigateToMovieDetails(movieId: Int?)
}

class MoviesRouter: MovieRouterProtocol {
    var movieDetailsViewController: UIViewController?
    var viewController: UINavigationController?
    
    static func createModule() -> UINavigationController {
        let viewController = MoviesViewController()
        
        let router: MovieRouterProtocol = MoviesRouter()
        let interactor: MovieInteractorProtocol = MoviesInteractor()
        let presenter: MoviePresenterProtocol = MoviesPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter as? MoviesPresenter
        viewController.presenter?.router = router
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationItem.title = "Movies"
        navigationController.navigationBar.prefersLargeTitles = true
        viewController.presenter?.router?.viewController = navigationController
        
        return navigationController
    }
    
    func navigateToMovieDetails(movieId: Int?) {
//     print(movieId)
        guard let viewController = viewController else { return }
        guard let movieDetailsViewController = movieDetailsViewController else {
            let movieDetailsViewController = MovieDetailsRouter.createModule(Movieid: movieId)
            self.movieDetailsViewController = movieDetailsViewController
            viewController.pushViewController(movieDetailsViewController, animated: true)
            return
        }
        let movieDetailsViewControllerProtocol = movieDetailsViewController as? MovieDetailViewProtocol
        movieDetailsViewControllerProtocol?.presenter?.fetchMovieById(Movieid: movieId!)
        viewController.pushViewController(movieDetailsViewController, animated: true)
        viewController.isNavigationBarHidden = false
    } 
//    @objc private func backButtontapped(_ sender: UIViewController) {
//        DispatchQueue.main.async { [weak self] in
//            self?.viewController?.popViewController(animated: true)
//        }
//    }

}
