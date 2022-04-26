//
//  MarvelListPresenter.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

class MarvelListPresenter {
    private var interactor: MarvelListInteractorProtocol
    weak var view: MarvelListViewProtocol?
    private var coordinatorOutput: (MarvelListOutput) -> Void

    init(interactor: MarvelListInteractorProtocol, coordinnatorOutput: @escaping (MarvelListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension MarvelListPresenter: MarvelListPresenterProtocol {
    func viewDidLoad() {
        interactor.getMarvelItems { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
