//
//  MarvelListInteractor.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

class MarvelListInteractor: MarvelListInteractorProtocol {
    
    var dataManager: MarvelListDataManagerProtocol

    init(dataManager: MarvelListDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
