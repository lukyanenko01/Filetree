//
//  MainViewController.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var listCV: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: gridCVLayout)
        cv.register(FileCell.self, forCellWithReuseIdentifier: FileCell.id)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
        
    private lazy var listCVLayout: UICollectionViewFlowLayout = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: view.bounds.width, height: 80)
        collectionFlowLayout.minimumInteritemSpacing = 6
        collectionFlowLayout.minimumLineSpacing = 6
        collectionFlowLayout.scrollDirection = .vertical
        return collectionFlowLayout
    }()
    
    private lazy var gridCVLayout: UICollectionViewFlowLayout = {
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: (view.bounds.width - 90) / 4 , height: view.bounds.height*0.10)
        collectionFlowLayout.minimumInteritemSpacing = 20
        collectionFlowLayout.minimumLineSpacing = 20
        return collectionFlowLayout
    }()
    
    private var isListView = false
    
  
   private var files = [File]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        listCV.delegate = self
        listCV.dataSource = self
        
        setupNavigationBar()
        getProduct()
        setConstraints()
    }
    
    //MARK: - DataBase
    private func getProduct() {
        DataBaseService.shared.getProducts { [self] result in
            self.listCV.reloadData() 
            switch result {
            case .success(let products):
                files = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
    
    private func setConstraints() {
        view.addSubview(listCV)
        NSLayoutConstraint.activate([
            listCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            listCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            listCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            listCV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc private func addFileButtonAction() {
        
    }
    
    @objc private func addFolderButtonAction() {
        
    }
    
    @objc private func switchLayoutButtonAction() {
        isListView.toggle()
        listCV.collectionViewLayout.invalidateLayout()
        listCV.performBatchUpdates(nil, completion: nil)
        listCV.startInteractiveTransition(to: isListView ? self.listCVLayout : self.gridCVLayout, completion: nil)
        listCV.finishInteractiveTransition()
    }
    
    @objc private func profileButtonAction() {
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        files.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FileCell.id, for: indexPath) as? FileCell else { return UICollectionViewCell() }
        cell.setup(product: files[indexPath.row])

        
        if !isListView {
            cell.viewBacgraund.stacImageName.axis = .vertical
            collectionView.reloadData()
        } else {
            cell.viewBacgraund.stacImageName.axis = .horizontal
            collectionView.reloadData()
        }
        return cell
    }
    
    
}
