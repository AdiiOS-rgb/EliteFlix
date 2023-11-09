//
//  ViewController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 19/10/23.
//

import UIKit
import TinyConstraints
import Kingfisher

protocol HomePresenterToViewProtocol: AnyObject {
    func onFetchMoviesSuccess()
    func configureTableHeaderView(data: HomeHeaderViewData)
}
protocol HomeTableViewSectionHeaderViewToViewProtocol {
    func navigateToMovie(type: String)
}

class HomeViewController: UIViewController, HomePresenterToViewProtocol {
    var presenter: HomeViewToPresenterProtocol
    
    init(presenter: HomeViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let headerView = HomeTableHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]
        presenter.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableHeaderView(data: HomeHeaderViewData) { // hearder of table view
        DispatchQueue.main.async { [weak self] in
            guard let headerView = self?.tableView.tableHeaderView as? HomeTableHeaderView else { return }
            headerView.configure(data: data)
            headerView.presenter = self?.presenter as? HomeTableHeaderToPresenterProtocol
        }
    }
    
    func onFetchMoviesSuccess() { // View Data
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.layoutIfNeeded()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections(tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        presenter.viewForHeaderInSection(tableView: tableView, section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenter.heightForRowAt(tableView: tableView, indexPath: indexPath)
    }
}

 extension HomeViewController: HomeTableViewSectionHeaderViewToViewProtocol {
    func navigateToMovie(type: String) { // Navigating View TO Movies
        presenter.navigateToMovies(type: type)
    }
 }
