//
//  MoviesController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 19/10/23.
//

import UIKit

protocol MovieViewProtocol {
    var presenter: MoviePresenterProtocol? {get set}
//    func configure(title: String, data: [CustomCollectionViewModel])
    func fetchedPopularMovie(List: PopularMovies?)
}

class MoviesViewController: UIViewController, MovieViewProtocol {
    var list: PopularMovies?
    var presenter: MoviePresenterProtocol?
    var router: MovieRouterProtocol?
    
    private lazy var titleLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private var collectionView: UICollectionView = {
        let view =  CVClass(
            layout: SetLayout(scrollDirection: .vertical,
                              itemSize: CGSize(width: 100, height: 150),
                              sectionInset: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1),
                              minimumLineSpaceing: 10,
                              minimumInteritemSpacing: 5),
            sections: 1
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CVClassCell.self,
                      forCellWithReuseIdentifier: CVClassCell.Identifier)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Movies"
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
//            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            
//        ])

        
        collectionView.top(to: view.safeAreaLayoutGuide)
        collectionView.left(to: view.safeAreaLayoutGuide)
        collectionView.right(to: view.safeAreaLayoutGuide)
        collectionView.bottom(to: view.safeAreaLayoutGuide)
    }

    func fetchedPopularMovie(List: PopularMovies?) {
        DispatchQueue.main.async {
//            self.collectionView.setVCData(List: List)
            self.collectionView.reloadData()
        }
        self.list = List
    }
//    func configure(title: String, data: [CustomCollectionViewModel]) {
//        DispatchQueue.main.async { [weak self] in
//            self?.titleLabel.text = title
//            self?.collectionView.configure(viewController: self, data: data)
//        }
//    }

}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numbersOfItemInSection(section: section) ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter?.ConfigCell(collectionView, cellForItemAt: indexPath) ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let data = list as? [MovieListObj]
//        print(list)
        let movieId = list?.list?[indexPath.row].id
//       router?.navigateToMovieDetails(movieId: movieId)
        presenter?.navigateToMovieDetails(movieId: movieId)
//        print(movieId)
    }
}
