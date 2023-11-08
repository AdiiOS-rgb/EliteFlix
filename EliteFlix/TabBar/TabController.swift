//
//  TabController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 19/10/23.
//

import UIKit

// class TabController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        SetupTabs()
//        
//        self.tabBar.barTintColor = .green
//        self.tabBar.tintColor = .red
//        self.tabBar.unselectedItemTintColor = .white
//    }
//    
//    private func SetupTabs() {
//        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
//        let Movie = self.createNav(with: "Movies", and: UIImage(systemName: "house"), vc: MoviesViewController())
//        let TvShow = self.createNav(with: "TV Shows", and: UIImage(systemName: "house"), vc: TvShowsViewController())
//        
//        self.setViewControllers([home, Movie, TvShow], animated: true)
//    }
//
//    private func createNav(with title: String, and image: UIImage?, vc:
//        UIViewController) -> UINavigationController {
//         let nav = UINavigationController(rootViewController: vc)
//        nav.tabBarItem.title = title
//        nav.tabBarItem.image = image
//        nav.viewControllers.first?.navigationItem.title = title + " Controllers"
//
//        return nav
//        }
// }

class TabController: UITabBarController {
    
    let homeViewController = HomeRouter.createModule()
    let movieViewController = MoviesRouter.createModule()
    let tvShowViewController = TVRouter.createModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabs()
    }
    
    private func setupUI() {
        self.tabBar.backgroundColor = AppTheme.tabBarBGColor
        self.tabBar.tintColor = AppTheme.tabBarTintColor
        self.tabBar.unselectedItemTintColor = AppTheme.tabBarUnselectedColor
    }
    private func setupTabs() {
        let homeTabItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "play.house.fill"))
        let movieTabItem = UITabBarItem(title: "Movie", image: UIImage(systemName: "movieclapper"), selectedImage: UIImage(named: "house"))
        let tvShowTabItem = UITabBarItem(title: "TVShow", image: UIImage(systemName: "tv"), selectedImage: UIImage(named: "play.tv.fill"))
        
        homeViewController.tabBarItem = homeTabItem
        movieViewController.tabBarItem = movieTabItem
        tvShowViewController.tabBarItem = tvShowTabItem
    
        self.viewControllers = [homeViewController, movieViewController, tvShowViewController]
    }
}
enum AppTheme {
    static let tabBarBGColor: UIColor = .white
    static let tabBarTintColor: UIColor = .red
    static let tabBarUnselectedColor: UIColor = .white
    static let activityIndicatorColor: UIColor = .gray
    
    static let cellLabelFont: UIFont = .systemFont(ofSize: 10)
    static let tableHeaderSectionLabelFont: UIFont = .systemFont(ofSize: 10)
    static let tableHeaderSectionButtonFont: UIFont = .systemFont(ofSize: 10)
    static let genreButtonFont: UIFont = .boldSystemFont(ofSize: 10)
}
