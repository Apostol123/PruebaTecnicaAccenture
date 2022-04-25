//
//  MarvelListPresenter.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

class MarvelListPresenter {
    var interactor: MarvelListInteractorProtocol
    weak var view: MarvelListViewProtocol?
    var coordinatorOutput: (MarvelListOutput) -> Void

    init(interactor: MarvelListInteractorProtocol, coordinnatorOutput: @escaping (MarvelListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension MarvelListPresenter: MarvelListPresenterProtocol {
    
}
