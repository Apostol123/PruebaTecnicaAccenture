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
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(MarvelListTableViewCell.self, forCellReuseIdentifier: String(describing: MarvelListTableViewCell.self))
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
        
    init (presenter: MarvelListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableViewLayout()
        presenter.viewDidLoad()
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}

extension MarvelListViewController: MarvelListViewProtocol{
    // TODO: Implement View Output Methods
}

extension MarvelListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MarvelListTableViewCell.self), for: indexPath) as?  MarvelListTableViewCell else {return UITableViewCell()}
        return cell
    }
    
    
}
