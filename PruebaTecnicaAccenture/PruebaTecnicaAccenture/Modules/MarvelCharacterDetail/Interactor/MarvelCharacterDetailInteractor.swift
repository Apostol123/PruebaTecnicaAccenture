//
//  MarvelCharacterDetailInteractor.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

class MarvelCharacterDetailInteractor: MarvelCharacterDetailInteractorProtocol {
    
    var dataManager: MarvelCharacterDetailDataManagerProtocol

    init(dataManager: MarvelCharacterDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
