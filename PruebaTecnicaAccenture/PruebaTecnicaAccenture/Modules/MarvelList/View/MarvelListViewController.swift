//
//  MarvelListViewController.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 25/4/22.
//  
//

import UIKit

class MarvelListViewController: UIViewController {
    
    let presenter: MarvelListPresenterProtocol
        
    init (presenter: MarvelListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MarvelListViewController: MarvelListViewProtocol{
    // TODO: Implement View Output Methods
}
