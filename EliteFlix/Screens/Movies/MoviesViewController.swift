//
//  MoviesController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 19/10/23.
//

import UIKit

protocol MoviesPresenterToViewProtocol: AnyObject {
    var presenter: MoviesViewToPresenterProtocol { get set }
    func configure(title: String, data: [CustomCollectionViewModel])
}

class MoviesViewController: UIViewController, MoviesPresenterToViewProtocol {
    var presenter: MoviesViewToPresenterProtocol
    
    private lazy var titleLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private lazy var collectionView: CustomCollectionView = {
        let customColletionView = CustomCollectionView(scrollDirection: .vertical, size: CGSize(width: 120, height: 210), cell: CustomCollectionViewCell.self, identifier: CustomCollectionViewCell.identifier)
        customColletionView.translatesAutoresizingMaskIntoConstraints = false
        return customColletionView
    }()
 
    init(presenter: MoviesViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    func configure(title: String, data: [CustomCollectionViewModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = title
            self?.collectionView.configure(viewController: self, data: data)
        }
    }   
}

extension MoviesViewController: CustomCollectionViewToViewProtocol {
    func navigateToDetails(type: String?, indexPath: IndexPath) {
        presenter.navigateToMovieDetails(type: type, indexPath: indexPath)
    }
}
