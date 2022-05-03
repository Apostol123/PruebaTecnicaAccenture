//
//  MarvelCharacterDetailPresenter.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

class MarvelCharacterDetailPresenter {
    private var interactor: MarvelCharacterDetailInteractorProtocol
    weak var view: MarvelCharacterDetailViewProtocol?
    private var coordinatorOutput: (MarvelCharacterDetailOutput) -> Void
    private let character: Character

    init(character: Character, interactor: MarvelCharacterDetailInteractorProtocol, coordinnatorOutput: @escaping (MarvelCharacterDetailOutput) -> Void) {
        self.character = character
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension MarvelCharacterDetailPresenter: MarvelCharacterDetailPresenterProtocol {
  
    func viewDidLoad() {
        view?.showLoader()
        interactor.getMarvelCharacter(id: "\(character.id ?? 0)") { result in
            switch result {
            case .success(let dtoMarvel):
                guard let characters = dtoMarvel.data?.results else {return}
                self.view?.showData(characters[0])
                self.view?.hideLoader()
            case .failure(_):
                self.view?.hideLoader()
            }
        }
    }
}
