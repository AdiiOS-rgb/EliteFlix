//
//  MovieDetailController.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 05/11/23.
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol {
    var presenter: MovieDetailpresenterProtocol? {get set}
    func fetchedMovieDetails(data: DetailsEntity)
    func fetchedYTVideo(data: [String])
    func fetchedCastDetails(data: [CustomCollectionViewModel])
   
}

class MovieDetailController: UIViewController, MovieDetailViewProtocol {
    
    var presenter: MovieDetailpresenterProtocol?
    var CustomLabels: DetailViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        presenter?.viewDidLoad()
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var movieDetailsView: UIView = {
        let view = EliteFlix.CustomLabels()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var youtubeCollectionViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "VIDEOS"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var youtubeCollectionView: CustomCollectionView = {
        let customCollectionView = CustomCollectionView(scrollDirection: .horizontal, size: CGSize(width: 200, height: 120), cell: YoutubeCollectionViewCell.self, identifier: YoutubeCollectionViewCell.identifier)
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return customCollectionView
    }()
    
    private lazy var castCollectionViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "CAST"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var castCollectionView: CustomCollectionView = {
        let customCollectionView = CustomCollectionView(scrollDirection: .horizontal, size: CGSize(width: 125, height: 210), cell: CustomCollectionViewCell.self, identifier: CustomCollectionViewCell.identifier)
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return customCollectionView
    }()
    
    func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(movieDetailsView)
        scrollView.addSubview(youtubeCollectionViewLabel)
        scrollView.addSubview(youtubeCollectionView)
        scrollView.addSubview(castCollectionViewLabel)
        scrollView.addSubview(castCollectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            movieDetailsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            movieDetailsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            youtubeCollectionViewLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            youtubeCollectionViewLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            youtubeCollectionViewLabel.topAnchor.constraint(equalTo: movieDetailsView.bottomAnchor, constant: 16),
            
            youtubeCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            youtubeCollectionView.heightAnchor.constraint(equalToConstant: 120),
            youtubeCollectionView.topAnchor.constraint(equalTo: youtubeCollectionViewLabel.bottomAnchor, constant: 4),
            
            castCollectionViewLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            castCollectionViewLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            castCollectionViewLabel.topAnchor.constraint(equalTo: youtubeCollectionView.bottomAnchor, constant: 16),
            
            castCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            castCollectionView.heightAnchor.constraint(equalToConstant: 210),
            castCollectionView.topAnchor.constraint(equalTo: castCollectionViewLabel.bottomAnchor, constant: 4),
            castCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
//        youtubeCollectionView.backgroundColor = .green
        CustomLabels = movieDetailsView as? DetailViewProtocol
//        castCollectionView.backgroundColor = .green
    } 
    func fetchedMovieDetails(data: DetailsEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.title = data.title
            self?.CustomLabels?.configure(data: data)
        }
    }
    
    func fetchedYTVideo(data: [String]) {
        youtubeCollectionView.configure(data: data)
//        print(data)
    }
    
    func fetchedCastDetails(data: [CustomCollectionViewModel]) {
        castCollectionView.configure(viewController: self, data: data)
    }
}

extension MovieDetailController: CustomCollectionViewToViewProtocol {
    func navigateToDetails(type: String?, indexPath: IndexPath) {
        presenter?.navigateToCastDetails(indexPath: indexPath)
    }
}
