//
//  FileCell.swift
//  FileTreeP
//
//  Created by Vladimir Lukyanenko on 26.02.2023.
//

import UIKit

class FileCell: UICollectionViewCell {
    
    static let id = FileCell.description()
    let viewBacgraund = FileViewCell()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(product: File) {
        self.viewBacgraund.titleLabel.text = product.title
    }
    
    private func setConstraints() {
        contentView.addSubview(viewBacgraund)
        NSLayoutConstraint.activate([
            viewBacgraund.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            viewBacgraund.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            viewBacgraund.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            viewBacgraund.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
}
