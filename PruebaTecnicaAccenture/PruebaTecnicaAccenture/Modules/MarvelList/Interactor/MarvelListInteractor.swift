//
//  MarvelListInteractor.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

class MarvelListInteractor: MarvelListInteractorProtocol {
    
    private var dataManager: MarvelListDataManagerProtocol

    init(dataManager: MarvelListDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getMarvelItems(completion: @escaping (Result<DtoMarvel, Error>) -> Void) {
        dataManager.getMarvelItems { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
