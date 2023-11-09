//
//  MovieDetailsTests.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 09/11/23.
//
import XCTest
@testable import EliteFlix

final class MovieDetailsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchMovieDetailsSuccess() {
        let movieId = 605116
        let presenter = MovieDetailsPresenter(view: MovieDetailController(), interactor: MovieDetailsInteractor(), router: MovieDetailsRouter(), Movieid: movieId)
        let interactor = MovieDetailsInteractor(presenter: presenter, repository: MovieRepositoryMock())
        presenter.interactor = interactor
        interactor.fetchMovieDetails(movieId: movieId, modelType: MovieAppDetails.self)
        
        let data = presenter.movieDetails
        let error = presenter.error
        
        XCTAssertNotNil(data, "MovieDetails data is nil while executing MovieDetailsInteractor -> fetchMovieDetails()")
        XCTAssertEqual(movieId, data?.id, "MovieDetails data is not matching with expected result while executing MovieDetailsInteractor -> fetchMovieDetails()")
        XCTAssertNil(error, "Error while executing MovieDetailsInteractor -> fetchMovieDetails()")
    }
    
}
