//
//  FileCell.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import UIKit

class FileCell: UICollectionViewCell {
    
    static let id = FileCell.description()
//    let viewBacgraund = FileViewCell()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont(name: "Next Demi", size: 13)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.168045789, green: 0.1881615222, blue: 0.1966018081, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var fileImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "doc.text.image")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stacImageName: UIStackView = {
       let stac = UIStackView(arrangedSubviews: [fileImageView, titleLabel])
        stac.axis = .vertical
        stac.spacing = 4
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    lazy var stacImage2Name: UIStackView = {
       let stac = UIStackView(arrangedSubviews: [fileImageView, titleLabel])
        stac.axis = .horizontal
        stac.spacing = 4
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stacImage2Name.isHidden = true
        
        setConstraints()
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.3
        layer.cornerRadius = 6
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(isListViewChanged(notification:)), name: .isListViewChanged, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func isListViewChanged(notification: Notification) {
         if let isListView = notification.object as? Bool {
             // Обновляем отображение в зависимости от значения isListView
             if isListView {
                 
                 stacImageName.axis = .horizontal
//                 self.stacImageName.isHidden = false
//                 self.stacImage2Name.isHidden = true

             } else {
//                 self.stacImageName.isHidden = true
//                 self.stacImage2Name.isHidden = false
                 stacImageName.axis = .vertical

             }
         }
     }
     
     deinit {
         // Удаляем наблюдатель за уведомлением при уничтожении объекта
         NotificationCenter.default.removeObserver(self)
     }
    
    public func setup(product: File) {
        self.titleLabel.text = product.title
    }
    
    private func setConstraints() {
        contentView.addSubview(stacImageName)
//        contentView.addSubview(stacImage2Name)

        NSLayoutConstraint.activate([
            stacImageName.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stacImageName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stacImageName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            stacImageName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
          
//            stacImage2Name.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            stacImage2Name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            stacImage2Name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            stacImage2Name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

        ])
    }
    
}

extension Notification.Name {
    static let isListViewChanged = Notification.Name("isListViewChanged")
}
