//
//  AppStartCoordinator.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//

import UIKit

class AppStartCoordinator: Coordinator {
    private var navigator: UINavigationController
    
    enum MainCoordinatorState {
        case initial
        case willShowListFlow
        case didShowMarvelList
        case willShowCharacterDetaill
    }
    
    private var state: MainCoordinatorState
    
    init(with navigator: UINavigationController, state: MainCoordinatorState) {
        self.navigator = navigator
        self.state = state
    }
    
    func start() {
        self.loop()
    }
    
    private func loop() {
        self.state = next(self.state)
        switch  self.state {
        case .willShowListFlow:
            goToListFlow()
        case .willShowCharacterDetaill:
            buildCharacterDetailModule() 
        case .initial, .didShowMarvelList:
            fatalError("Unexpected Case in Main Coordinator")
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowListFlow
        case .didShowMarvelList:
            return .willShowCharacterDetaill
        case .willShowListFlow, .willShowCharacterDetaill:
            return nextState
        }
    }
    
    
    private func goToListFlow() {
        let vc = MarvelListBuilder { output in
            
            switch output {
            case .goToCharacterDetail:
                self.state = .didShowMarvelList
                self.loop()
            }
            
        }.build()
        self.navigator.setViewControllers([vc], animated: true)
    }
    
    private func buildCharacterDetailModule() {
        let vc = MarvelCharacterDetailBuilder { _ in
            
        }.build()
        self.navigator.pushViewController(vc, animated: true)
    }
}
