//
//  MainViewController.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
  
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }


    private func setupNavigationBar() {
        let addFileButton = UIBarButtonItem(image: UIImage(systemName: "doc.fill.badge.plus"), style: .plain, target: self, action: #selector(addFileButtonAction))
        let addFolderButton = UIBarButtonItem(image: UIImage(systemName: "folder.fill.badge.plus"), style: .plain, target: self, action: #selector(addFolderButtonAction))
        let switchLayoutButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(switchLayoutButtonAction))
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(profileButtonAction))
        
        navigationController?.modalTransitionStyle = .coverVertical
        navigationItem.title = "File Tree"
        navigationController?.view.backgroundColor = .clear
        navigationItem.rightBarButtonItems = [switchLayoutButton, addFolderButton, addFileButton]
        navigationItem.leftBarButtonItem = profileButton
        
    }
    
    @objc private func addFileButtonAction() {
        
    }
    
    @objc private func addFolderButtonAction() {
        
    }
    
    @objc private func switchLayoutButtonAction() {
        
    }
    
    @objc private func profileButtonAction() {
        
    }
}

