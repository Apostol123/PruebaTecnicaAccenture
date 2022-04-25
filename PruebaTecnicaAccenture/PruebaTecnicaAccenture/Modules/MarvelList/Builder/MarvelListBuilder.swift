//
//  MarvelListBuilder.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import Foundation
import UIKit

class MarvelListBuilder: Builder {
    
    private var coordinatorOutput: (MarvelListOutput) -> Void
    
    init(coordinatorOutput: @escaping (MarvelListOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = MarvelListDataManager()
        let interactor = MarvelListInteractor(dataManager: dataManager)
        let presenter = MarvelListPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = MarvelListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
