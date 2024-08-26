//
//  PicturesFeedCollectionViewCell.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

protocol PicturesFeedCollectionViewCellDelegate: AnyObject {
    func imageDidTapped(image: UIImage, name: String)
}

class PicturesFeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "picturesFeedCollectionViewCell"
    weak var delegate: PicturesFeedCollectionViewCellDelegate?
    var name: String?
    
    // MARK: - Private properties
    
    private let container: UIView = {
        let item = UIView()
        return item
    }()
    
    private let image: UIImageView = {
        let image = UIImage(named: "")
        let item = UIImageView(image: image)
        item.contentMode = .scaleAspectFit
        return item
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configure(image: String, name: String) {
        if image != "" {
            let tap = UITapGestureRecognizer(target: self, action: #selector(imageDidTapped))
            contentView.addGestureRecognizer(tap)
        }
        self.name = name
        self.image.sd_setImage(
            with: URL(string: image),
            placeholderImage: UIImage(named: "noimage")
        )
    }
    
    // MARK: - Private methods
    
    private func setupUI() {}
    
    private func setupLayout() {
        contentView.addSubview(container)
        container.addSubview(image)
        
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.height.equalTo(400)
        }
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc
    private func imageDidTapped() {
        if let image = self.image.image {
            delegate?.imageDidTapped(image: image, name: self.name ?? "Untitled")
        }
    }
}
