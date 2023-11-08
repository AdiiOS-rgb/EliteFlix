//
//  CommanViewControllerDetails.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 02/11/23.
//

import Foundation
import UIKit
import TinyConstraints

protocol TVDetailsViewProtocol {
    var presenter: TVDetailsPresenterProtocol? {get set}
    func FetchedTVShowList(data: DetailsEntity)
    func onFetchTvShowsVideosSuccess(data: [String])
    func onFetchTvShowsCastSuccess(data: [CustomCollectionViewModel])
}

class TVShowDetailsVC: UIViewController, TVDetailsViewProtocol {
    var detailView: DetailViewProtocol?
    var presenter: TVDetailsPresenterProtocol?
    var indexPath: IndexPath?
    var id: Int?
    
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
        let view = CustomLabels()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var youtubeCollectionViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "VIDOES"
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
    
//    init(presenter: TVDetailsPresenterProtocol) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
            youtubeCollectionView.topAnchor.constraint(equalTo: youtubeCollectionViewLabel.bottomAnchor, constant: 4),
            youtubeCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            castCollectionViewLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            castCollectionViewLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            castCollectionViewLabel.topAnchor.constraint(equalTo: youtubeCollectionView.bottomAnchor, constant: 16),
            
            castCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            castCollectionView.topAnchor.constraint(equalTo: castCollectionViewLabel.bottomAnchor, constant: 4),
            castCollectionView.heightAnchor.constraint(equalToConstant: 210),
            castCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
//        youtubeCollectionView.backgroundColor = .red
        detailView = movieDetailsView as? DetailViewProtocol
    }
    
    func FetchedTVShowList(data: DetailsEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.title = data.title
            self?.detailView?.configure(data: data)
        }
    }
    
    func onFetchTvShowsVideosSuccess(data: [String]) {
        youtubeCollectionView.configure(data: data)
    }
    
    func onFetchTvShowsCastSuccess(data: [CustomCollectionViewModel]) {
        castCollectionView.configure(viewController: self, data: data)
    }
}

extension TVShowDetailsVC: CustomCollectionViewToViewProtocol {
    func navigateToDetails(type: String?, indexPath: IndexPath) {
        presenter?.navigateToCastDetails(indexPath: indexPath)
    }
}
