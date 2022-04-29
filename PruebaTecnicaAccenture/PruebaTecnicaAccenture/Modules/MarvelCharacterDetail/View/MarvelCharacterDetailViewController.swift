//
//  MarvelCharacterDetailViewController.swift
//  PruebaTecnicaAccenture
//
//  Created by Alex Apostol on 28/4/22.
//  
//

import UIKit

class MarvelCharacterDetailViewController: UIViewController {
    
    enum SegmentType: Int {
        case stories
        case series
        case comics
    }
    
    
    private let presenter: MarvelCharacterDetailPresenterProtocol
    
    private var currentSegmentSelected: SegmentType = .stories {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var storiesContent: [StoriesItem] = []
    
    private var comisContent: [ComicsItem] = []
    
    private var seriesContent: [ComicsItem] = []
    
    private lazy var segmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(frame: .zero)
        segment.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segment.insertSegment(withTitle: presenter.getlabelForKey(key: "lng.common.stories"), at: 0, animated: true)
        segment.insertSegment(withTitle: presenter.getlabelForKey(key: "lng.common.series"), at: 1, animated: true)
        segment.insertSegment(withTitle: presenter.getlabelForKey(key: "lng.common.comics"), at: 2, animated: true)
        segment.addTarget(self, action: #selector(didTapSegment), for: .valueChanged)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
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
    
    @objc
    private func didTapSegment() {
        guard let currentSegmentType = SegmentType(rawValue: segmentControll.selectedSegmentIndex) else { return }
        currentSegmentSelected = currentSegmentType
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = presenter.getlabelForKey(key: "lng.character.detail.title").replacingOccurrences(of: "%", with: presenter.marvelCharacter.name ?? "")
        setUpCharacterViewLayout()
        setUpDescriptionLabelLayout()
        setUpSegmentControllerLayout()
        storiesContent = presenter.marvelCharacter.stories?.items ?? []
        comisContent = presenter.marvelCharacter.comics?.items ?? []
        seriesContent = presenter.marvelCharacter.series?.items ?? []
        setUpTableViewLayout()
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
    
    private func setUpSegmentControllerLayout() {
        view.addSubview(segmentControll)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        segmentControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        segmentControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        segmentControll.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentControll.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension MarvelCharacterDetailViewController: MarvelCharacterDetailViewProtocol{
    // TODO: Implement View Output Methods
}

extension MarvelCharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentSegmentSelected {
        case .stories:
            return storiesContent.count
        case .series:
            return seriesContent.count
        case .comics:
            return comisContent.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        var content = cell.defaultContentConfiguration()
        content.textProperties.alignment = .justified
        switch currentSegmentSelected {
        case .stories:
            let item = storiesContent[indexPath.row]
            content.text = item.name ?? ""
        case .series:
            let item = seriesContent[indexPath.row]
            content.text = item.name ?? ""
        case .comics:
            let item = comisContent[indexPath.row]
            content.text = item.name ?? ""
        }
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
}
