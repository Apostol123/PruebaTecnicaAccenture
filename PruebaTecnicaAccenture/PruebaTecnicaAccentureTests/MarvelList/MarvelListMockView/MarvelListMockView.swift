//
//  MarvelListMockPresenter.swift
//  PruebaTecnicaAccentureTests
//
//  Created by Alex Apostol on 30/4/22.
//

import Foundation
@testable import PruebaTecnicaAccenture

class MarvelListMockViewController: MarvelListViewProtocol {
    var characterData: [Character] = []
    var showLoaderWasCalled = false
    var hideLoaderWasCalled = false
    
    func showData(data: [Character]) {
        self.characterData = data
    }
    
    func showLoader() {
        showLoaderWasCalled = true
    }
    
    func hideLoader() {
        hideLoaderWasCalled = true
    }
    
    
    
}
