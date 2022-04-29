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
    var charcterImageURL: String {
        let imagePath = marvelCharacter.thumbnail?.path ?? ""
        let imageExtension = marvelCharacter.thumbnail?.thumbnailExtension?.rawValue ?? ""
        let imageURL = imagePath+"."+imageExtension
        return imageURL
    }
    
    var marvelCharacter: Character {
        return character
    }
}
