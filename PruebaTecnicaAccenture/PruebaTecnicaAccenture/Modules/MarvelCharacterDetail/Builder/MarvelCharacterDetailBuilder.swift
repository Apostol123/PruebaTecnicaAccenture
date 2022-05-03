//
//  MarvelCharacterDetailBuilder.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation
import UIKit

class MarvelCharacterDetailBuilder: Builder {
    
   private var coordinatorOutput: (MarvelCharacterDetailOutput) -> Void
    private let character: Character
    
    init(character: Character, coordinatorOutput: @escaping (MarvelCharacterDetailOutput) -> Void) {
        self.character = character
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = MarvelCharacterDetailDataManager()
        let interactor = MarvelCharacterDetailInteractor(dataManager: dataManager)
        let presenter = MarvelCharacterDetailPresenter(character: character, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = MarvelCharacterDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
