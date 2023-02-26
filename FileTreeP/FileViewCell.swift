////
////  FileViewCell.swift
////  FileTreeP
////
////  Created by Vladimir Lukyanenko on 26.02.2023.
////
//
//import UIKit
//
//class FileViewCell: UIView {
//    
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.font =  UIFont(name: "Next Demi", size: 13)
//        label.textAlignment = .center
//        label.textColor = #colorLiteral(red: 0.168045789, green: 0.1881615222, blue: 0.1966018081, alpha: 1)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    var fileImageView: UIImageView = {
//       let image = UIImageView()
//        image.image = UIImage(systemName: "doc.text.image")
//        image.contentMode = .scaleAspectFill
//        return image
//    }()
//    
//    lazy var stacImageName: UIStackView = {
//       let stac = UIStackView(arrangedSubviews: [fileImageView, titleLabel])
//        stac.axis = .vertical
//        stac.spacing = 18
//        stac.distribution = .fill
//        stac.translatesAutoresizingMaskIntoConstraints = false
//        return stac
//    }()
//    
//    
//    //MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .red
//        
//        setConstraints()
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(isListViewChanged(notification:)), name: .isListViewChanged, object: nil)
//
//        
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func isListViewChanged(notification: Notification) {
//         if let isListView = notification.object as? Bool {
//             // Обновляем отображение в зависимости от значения isListView
//             if isListView {
//                 self.stacImageName.axis = .horizontal
//             } else {
//                 self.stacImageName.axis = .vertical
//             }
//         }
//     }
//     
//     deinit {
//         // Удаляем наблюдатель за уведомлением при уничтожении объекта
//         NotificationCenter.default.removeObserver(self)
//     }
//    
//    //MARK: - Constraints
//    private func setConstraints() {
//        addSubview(stacImageName)
//        NSLayoutConstraint.activate([
//            stacImageName.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            stacImageName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            stacImageName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            stacImageName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//        ])
//    }
//}
//
//extension Notification.Name {
//    static let isListViewChanged = Notification.Name("isListViewChanged")
//}
