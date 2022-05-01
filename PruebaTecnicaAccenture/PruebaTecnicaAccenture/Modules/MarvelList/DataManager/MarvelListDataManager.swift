//
//  MarvelListDataManager.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

class MarvelListDataManager: MarvelListDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
    
    func getMarvelItems(completion: @escaping (Result<DtoMarvel, Error>) -> Void) {
        serviceProxy.getItem(url: Endpoint.getCharacters.rawValue, type: DtoMarvel.self, parameters: AppManager.sharedInstance.buildParams()) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
