//
//  MarvelCharacterDetailDataManager.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

class MarvelCharacterDetailDataManager: MarvelCharacterDetailDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
    
    func getMarvelItems(id: String, completion: @escaping (Result<DtoMarvel, Error>) -> Void) {
      
        serviceProxy.getItem(url: Endpoint.getCharacters.rawValue+"/"+id, type: DtoMarvel.self, parameters: AppManager.sharedInstance.buildParams()) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
