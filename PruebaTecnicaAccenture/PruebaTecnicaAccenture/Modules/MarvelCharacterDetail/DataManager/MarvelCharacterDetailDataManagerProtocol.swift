//
//  MarvelCharacterDetailDataManagerProtocol.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

protocol MarvelCharacterDetailDataManagerProtocol : AnyObject {
    func getMarvelItems(id: String, completion: @escaping (Result<DtoMarvel, Error>) -> Void)
}
