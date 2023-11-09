//
//  MoviesInteractor.swift
//  EliteFlix
//
//  Created by Adityakumar Ramnuj on 29/10/23.
//

import Foundation
import UIKit

protocol MoviesPresenterToInteractorProtocol {
    var presenter: MoviesInteractorToPresenterProtocol? { get set }
}

class MoviesInteractor: MoviesPresenterToInteractorProtocol {
     var presenter: MoviesInteractorToPresenterProtocol?
    
    init(presenter: MoviesInteractorToPresenterProtocol?) {
        self.presenter = presenter
    }
}
