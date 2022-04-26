//
//  MarvelListDataManagerProtocol.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation

protocol MarvelListDataManagerProtocol : AnyObject {
    func getMarvelItems(completion: @escaping (Result<DtoMarvel, Error>) -> Void)
}
