//
//  TvShowsController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 19/10/23.
//

import UIKit

protocol TVviewProtocol {
    var presenter: TVPresenterProtocol? {get set}
    
    func fetchedTVshowsList(List: [CustomObj], delegate: CommanCVToPresenter)
    
}

class TvShowsViewController: UIViewController, TVviewProtocol {
    var presenter: TVPresenterProtocol?
    
    private var customVC: MainCollectionView = {
        let View = MainCollectionView(scrollDirection: .vertical)
        View.translatesAutoresizingMaskIntoConstraints = false
        return View
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "TV Shows"
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        view.addSubview(customVC)
    }
    func setupConstraints() {
        customVC.top(to: view.safeAreaLayoutGuide)
        customVC.left(to: view.safeAreaLayoutGuide)
        customVC.right(to: view.safeAreaLayoutGuide)
        customVC.bottom(to: view.safeAreaLayoutGuide)
    }
    
    func fetchedTVshowsList(List: [CustomObj], delegate: CommanCVToPresenter) {
        DispatchQueue.main.async {
            self.customVC.setVCData(List: List, delegate: delegate)
            self.customVC.collectionView.reloadData()
        }
    }

}
