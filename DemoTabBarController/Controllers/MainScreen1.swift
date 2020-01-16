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
    
    var messages: [MessageViewModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setData()
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
    
    func setData() {
        messages = [
            MessageViewModel(image: UIImage(named: "avatar1"), name: "Long", detail: "Hello, how are you?", time: "2 phút"),
            MessageViewModel(image: UIImage(named: "avatar2"), name: "Quỳnh", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", time: "8 phút"),
            MessageViewModel(image: UIImage(named: "avatar3"), name: "Phú", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", time: "15 phút"),
            MessageViewModel(image: UIImage(named: "avatar4"), name: "Tuấn Anh", detail: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", time: "30 phút"),
            MessageViewModel(image: UIImage(named: "avatar5"), name: "Jerry", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minimo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, anim id est laborum.", time: "1 tiếng"),
            MessageViewModel(image: UIImage(named: "avatar6"), name: "Micheal", detail: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", time: "2 tiếng"),
            MessageViewModel(image: UIImage(named: "avatar7"), name: "Pete Jackson", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", time: "2 ngày"),
            MessageViewModel(image: UIImage(named: "avatar8"), name: "Maria", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", time: "2 ngày"),
            MessageViewModel(image: UIImage(named: "avatar9"), name: "Ozawa", detail: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", time: "2 ngày"),
            MessageViewModel(image: UIImage(named: "avatar10"), name: "Phượng", detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", time: "2 ngày"),
        ]
    }
}

extension MainScreen1: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell()
        cell.setData(message: messages![indexPath.row])
        return cell
    }
}
