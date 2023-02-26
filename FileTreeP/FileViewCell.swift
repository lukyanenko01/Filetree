//
//  FileViewCell.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import UIKit

class FileViewCell: UIView {
    
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
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var stacImageName: UIStackView = {
       let stac = UIStackView(arrangedSubviews: [fileImageView, titleLabel])
        stac.axis = .vertical
        stac.spacing = 18
        stac.translatesAutoresizingMaskIntoConstraints = false
        return stac
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.3
        layer.cornerRadius = 6
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        addSubview(stacImageName)
        NSLayoutConstraint.activate([
            stacImageName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stacImageName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stacImageName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stacImageName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
