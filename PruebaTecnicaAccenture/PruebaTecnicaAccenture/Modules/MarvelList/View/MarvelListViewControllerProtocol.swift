//
//  MarvelListViewControllerProtocol.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import UIKit

protocol MarvelListViewProtocol: AnyObject, Loader {
    func showData(data: [Character])
}
