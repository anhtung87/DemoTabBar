//
//  SearchViewController.swift
//  DemoTabBarController
//
//  Created by Hoang Tung on 1/16/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrowLeftIcon = UIImage(named: "arrowLeft")
        let backItem = UIBarButtonItem(image: arrowLeftIcon, style: .plain, target: self, action: #selector(cancel))
        let searchBar = UISearchBar()
        searchBar.placeholder = "Tìm bạn bè, tin nhắn"
        searchBar.sizeToFit()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = backItem
    }

    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
}

