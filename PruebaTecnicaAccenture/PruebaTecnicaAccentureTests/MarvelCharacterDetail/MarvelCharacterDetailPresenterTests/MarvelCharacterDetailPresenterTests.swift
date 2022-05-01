//
//  MarvelCharacterDetailPresenterTests.swift
//  PruebaTecnicaAccentureTests
//
//  Created by Alex Apostol on 1/5/22.
//

import XCTest
@testable import PruebaTecnicaAccenture

class MarvelCharacterDetailPresenterTests: XCTestCase {

    var dataManager: MarvelCharacterDetailDataManager?
    var interactor: MarvelCharacterDetailInteractor?
    var presenter: MarvelCharacterDetailPresenter?
    let view = MarvelCharacterDetailMockView()
    
    override func setUp() {
        super.setUp()
        dataManager = MarvelCharacterDetailDataManager()
        interactor = MarvelCharacterDetailInteractor(dataManager: dataManager!)
        let  mockCharacter = Character(id: 1017100, name: nil, resultDescription: nil, modified: nil, thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
        presenter = MarvelCharacterDetailPresenter(character: mockCharacter, interactor: interactor!, coordinnatorOutput: { _ in
            
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
        
        wait(for: [expectaction], timeout: 5)
        XCTAssert(view.showDataWasCalled)
       
        XCTAssert(view.hideLoaderWasCalled)
        
    }
    
    override func tearDown() {
        dataManager = nil
        interactor = nil
        presenter = nil
        super.tearDown()
    }

}
