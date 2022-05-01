//
//  MarvelCharacterDetailMockView.swift
//  PruebaTecnicaAccentureTests
//
//  Created by Alex Apostol on 1/5/22.
//

import Foundation
@testable import PruebaTecnicaAccenture

class MarvelCharacterDetailMockView: MarvelCharacterDetailViewProtocol {
    
    var showDataWasCalled = false
    var showLoaderWasCalled = false
    var hideLoaderWasCalled = false
    
    func showData(_ character: Character) {
        showDataWasCalled = true
    }
    
    func showLoader() {
        showLoaderWasCalled = true
    }
    
    func hideLoader() {
        hideLoaderWasCalled = true
    }
}
