//
//  MarvelCharacterDetailViewController.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import UIKit

class MarvelCharacterDetailViewController: UIViewController {
    
    let presenter: MarvelCharacterDetailPresenterProtocol
        
    init (presenter: MarvelCharacterDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = presenter.getlabelForKey(key: "lng.character.detail.title")
    }
    
}

extension MarvelCharacterDetailViewController: MarvelCharacterDetailViewProtocol{
    // TODO: Implement View Output Methods
}
