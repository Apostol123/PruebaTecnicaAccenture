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
    
    func getMarvelCharacter(id: String, completion: @escaping (Result<DtoMarvel, Error>) -> Void) {
        dataManager.getMarvelCharacter(id: id) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
