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
        view?.showLoader()
        interactor.getMarvelItems { result in
            switch result {
            case .success(let dtoMarvel):
                self.view?.showData(data: dtoMarvel.data?.results ?? [])
                self.view?.hideLoader()
            case .failure(_):
                self.view?.hideLoader()
            }
        }
    }
    
    func goToCharacterDetail() {
        coordinatorOutput(.goToCharacterDetail)
    }
}
