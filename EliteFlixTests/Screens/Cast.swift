//
//  Cast.swift
//  EliteFlixTests
//
//  Created by Adityakumar Ramnuj on 08/11/23.
//

import XCTest
@testable import EliteFlix

final class CastDetailsTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFetchCastDetailsSuccess() {
        let castId = 500
        let presenter = CastDetailsPresenter(type: nil, castId: castId, router: CastDetailsRouter())
        let interactor = CastDetailsInteractor(castRepository: CastRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchCastDetails(castId: castId, modelType: PersonDetails.self)
        
        let data = presenter.personDetails
        let error = presenter.error
        
        XCTAssertNotNil(data, "CastDetails data is nil while executing CastDetailsInteractor -> fetchCastDetails()")
        XCTAssertEqual(castId, data?.id, "CastDetails data is not matching with expected result while executing CastDetailsInteractor -> fetchCastDetails()")
        XCTAssertNil(error, "Error while executing CastDetailsInteractor -> fetchCastDetails()")
    }
    
    func testFetchTvShowsKnownForSuccess() {
        let castId = 1937988
        let type = String(describing: TvShows.self)
        let presenter = CastDetailsPresenter(type: type, castId: castId, router: CastDetailsRouter())
        let interactor = CastDetailsInteractor(castRepository: CastRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchKnownFor(castId: castId, type: type)
        
        let data = presenter.knownForTvShows
        let error = presenter.error
        
        XCTAssertNotNil(data, "TvShowsKnownFor data is nil while executing CastDetailsInteractor -> fetchKnownFor()")
        XCTAssertEqual(castId, data?.id, "TvShowsKnownFor data is not matching with expected result while executing CastDetailsInteractor -> fetchKnownFor()")
        XCTAssertNil(error, "Error while executing CastDetailsInteractor -> fetchKnownFor()")
    }
    
    func testFetchTvShowsKnownForFailure() {
        let castId = 1937988
        let type = "Test"
        let presenter = CastDetailsPresenter(type: type, castId: castId, router: CastDetailsRouter())
        let interactor = CastDetailsInteractor(castRepository: CastRepositoryMock(), presenter: presenter)
        presenter.interactor = interactor
        interactor.fetchKnownFor(castId: castId, type: type)
        
        let data = presenter.knownForTvShows
        let error = presenter.error
        
        XCTAssertNil(data, "TvShowsKnownFor data is not nil while executing CastDetailsInteractor -> fetchKnownFor()")
        XCTAssertNotNil(error, "Error is nil while executing CastDetailsInteractor -> fetchKnownFor()")
    }
    
}
