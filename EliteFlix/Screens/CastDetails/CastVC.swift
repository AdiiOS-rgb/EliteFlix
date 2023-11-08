//
//  CastVC.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 06/11/23.
//

import Foundation
import UIKit

protocol CastDetailsPresenterToViewProtocol: AnyObject {
    var presenter: CastDetailsViewToPresenterProtocol { get set }
    func onFetchPersonDetailsSuccess(data: PersonDetails)
    func onFetchPersonPhotosSuccess(data: [CustomCollectionViewModel])
    func onFetchKnownForSuccess(data: [CustomCollectionViewModel])
    func onFetchError(error: DataError)
}

class CastDetailsViewController: UIViewController, CastDetailsPresenterToViewProtocol {
    var presenter: CastDetailsViewToPresenterProtocol

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var personImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 100
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    private lazy var personNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var personDepartmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var personBiographyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PHOTOS"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var photosCollectionView: CustomCollectionView = {
        let customCollectionView = CustomCollectionView(scrollDirection: .horizontal, size: CGSize(width: 125, height: 170), cell: CustomCollectionViewCell.self, identifier: CustomCollectionViewCell.identifier)
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return customCollectionView
    }()
    
    private lazy var knownForLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "KNOWN FOR"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private lazy var knownForCollectionView: CustomCollectionView = {
        let customCollectionView = CustomCollectionView(scrollDirection: .horizontal, size: CGSize(width: 125, height: 210), cell: CustomCollectionViewCell.self, identifier: CustomCollectionViewCell.identifier)
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return customCollectionView
    }()
    
    init(presenter: CastDetailsViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.viewDidLoad()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(personImage)
        scrollView.addSubview(personNameLabel)
        scrollView.addSubview(personDepartmentLabel)
        scrollView.addSubview(personBiographyLabel)
        scrollView.addSubview(photosLabel)
        scrollView.addSubview(photosCollectionView)
        scrollView.addSubview(knownForLabel)
        scrollView.addSubview(knownForCollectionView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            personImage.widthAnchor.constraint(equalToConstant: 200),
            personImage.heightAnchor.constraint(equalToConstant: 200),
            
            personNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            personNameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            personNameLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 16),
            
            personDepartmentLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            personDepartmentLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            personDepartmentLabel.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor, constant: 8),
            
            personBiographyLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            personBiographyLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            personBiographyLabel.topAnchor.constraint(equalTo: personDepartmentLabel.bottomAnchor, constant: 16),
            
            photosLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            photosLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            photosLabel.topAnchor.constraint(equalTo: personBiographyLabel.bottomAnchor, constant: 16),
            
            photosCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            photosCollectionView.heightAnchor.constraint(equalToConstant: 170),
            photosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 8),

            knownForLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            knownForLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            knownForLabel.topAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: 16),
            
            knownForCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            knownForCollectionView.heightAnchor.constraint(equalToConstant: 210),
            knownForCollectionView.topAnchor.constraint(equalTo: knownForLabel.bottomAnchor, constant: 8),
            knownForCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func onFetchPersonDetailsSuccess(data: PersonDetails) {
        DispatchQueue.main.async { [weak self] in
            let path = "\(Constants.imagePath)\(data.profilePath ?? "")"
            self?.personImage.setImage(with: path)
            self?.title = data.name
            self?.personNameLabel.text = data.name
            self?.personDepartmentLabel.text = data.knownForDepartement
            self?.personBiographyLabel.text = data.biography
        }
    }
    
    func onFetchPersonPhotosSuccess(data: [CustomCollectionViewModel]) {
        photosCollectionView.configure(data: data)
    }
    
    func onFetchKnownForSuccess(data: [CustomCollectionViewModel]) {
        knownForCollectionView.configure(data: data)
    }
    
    func onFetchError(error: DataError) {
        print(error.localizedDescription)
    }
}
