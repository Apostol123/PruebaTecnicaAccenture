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
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = "\(timestamp)\( Constants.privateApiKey)\(Constants.apiKey)".MD5
        
        let params = ["hash": hash , "apikey": Constants.apiKey, "ts": timestamp]
        serviceProxy.getItem(url: Endpoint.getCharacters.rawValue, type: DtoMarvel.self, parameters: params) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
