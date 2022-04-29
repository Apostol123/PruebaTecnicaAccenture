//
//  MarvelCharacterDetailViewController.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import UIKit

class MarvelCharacterDetailViewController: UIViewController {
    
    private let presenter: MarvelCharacterDetailPresenterProtocol
    
    private lazy var characterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.sd_setImage(with: URL(string: presenter.charcterImageURL), placeholderImage: nil)
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.text = presenter.marvelCharacter.resultDescription
        return label
    }()
    
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
        self.title = presenter.getlabelForKey(key: "lng.character.detail.title").replacingOccurrences(of: "%", with: presenter.marvelCharacter.name ?? "")
        setUpCharacterViewLayout()
        setUpDescriptionLabelLayout()
    }
    
    private func setUpCharacterViewLayout() {
        view.addSubview(characterImage)
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        characterImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
    }
    
    private func setUpDescriptionLabelLayout() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 24).isActive = true
    }
    
}

extension MarvelCharacterDetailViewController: MarvelCharacterDetailViewProtocol{
    // TODO: Implement View Output Methods
}
