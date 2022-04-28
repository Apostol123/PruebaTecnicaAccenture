//
//  MarvelCharacterDetailPresenter.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

class MarvelCharacterDetailPresenter {
    var interactor: MarvelCharacterDetailInteractorProtocol
    weak var view: MarvelCharacterDetailViewProtocol?
    var coordinatorOutput: (MarvelCharacterDetailOutput) -> Void

    init(interactor: MarvelCharacterDetailInteractorProtocol, coordinnatorOutput: @escaping (MarvelCharacterDetailOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension MarvelCharacterDetailPresenter: MarvelCharacterDetailPresenterProtocol {
    
}
