//
//  MarvelCharacterDetailPresenterProtocol.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import Foundation

protocol MarvelCharacterDetailPresenterProtocol: AnyObject, GetLabel {
    var marvelCharacter: Character {get}
    var charcterImageURL: String {get}
}
