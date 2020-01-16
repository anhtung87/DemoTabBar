//
//  MainScreen1.swift
//  DemoTabBarController
//
//  Created by Hoang Tung on 1/13/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class MainScreen1: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        
        let searchIconItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchFunc))
        let searchLabelItem = UIBarButtonItem(title: "Tìm bạn bè, tin nhắn", style: .plain, target: self, action: #selector(searchFunc))
        
        navigationItem.leftBarButtonItems = [searchIconItem, searchLabelItem]
        
        let AddIconItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFunc))
        let AddChatItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addFunc))
        
        navigationItem.rightBarButtonItems = [AddIconItem, AddChatItem]
        
        let navigationItems = [AddIconItem, AddChatItem, searchLabelItem]
        for item in navigationItems {
            item.tintColor = .white
        }
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func addFunc() {
        let addVC = AddViewController()
        addVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc func searchFunc() {
        let searchVC = SearchViewController()
        searchVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension MainScreen1: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
