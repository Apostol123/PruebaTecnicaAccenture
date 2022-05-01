//
//  MarvelListPresenterTests.swift
//  PruebaTecnicaAccentureTests
//
//  Created by Alex Apostol on 30/4/22.
//

import XCTest
@testable import PruebaTecnicaAccenture

class MarvelListPresenterTests: XCTestCase {

    var dataManager: MarvelListDataManager?
    var interactor: MarvelListInteractor?
    var presenter: MarvelListPresenter?
    let view = MarvelListMockViewController()
    
    override func setUp() {
        super.setUp()
        dataManager = MarvelListDataManager()
        interactor = MarvelListInteractor(dataManager: dataManager!)
        presenter = MarvelListPresenter(interactor: interactor!, coordinnatorOutput: { _ in
            
        })
        presenter?.view = view
    }
    
    func testViewDidLoad() {
        
        let expectaction = XCTestExpectation(description: #function)
        
        presenter?.viewDidLoad()
        XCTAssert(view.showLoaderWasCalled)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {

            expectaction.fulfill()
        })
        wait(for: [expectaction], timeout: 4)
        XCTAssert(view.characterData.count > 0)
        
        XCTAssert(view.hideLoaderWasCalled)
        
    }
    
    override func tearDown() {
        dataManager = nil
        interactor = nil
        presenter = nil
        super.tearDown()
    }

}
