//
//  MarvelCharacterDetailInteractorProtocol.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

protocol MarvelCharacterDetailInteractorProtocol : AnyObject {
    func getMarvelCharacter(id: String, completion: @escaping (Result<DtoMarvel, Error>) -> Void)
}
