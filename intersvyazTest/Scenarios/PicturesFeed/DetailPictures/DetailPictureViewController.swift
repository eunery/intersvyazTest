//
//  DetailPictureViewController.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import UIKit
import SnapKit

class DetailPictureViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let image: UIImageView = {
        let image = UIImage(named: "")
        let item = UIImageView(image: image)
        item.contentMode = .scaleAspectFit
        return item
    }()
    
    private let label: UILabel = {
        let item = UILabel()
        return item
    }()
    
    private let buttonShare: UIButton = {
        let item = UIButton()
        item.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return item
    }()
    
    // MARK: - Init
    
    init(image: UIImage, name: String) {
        super.init(nibName: nil, bundle: nil)
        self.image.image = image
        self.label.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.buttonShare.addTarget(self, action: #selector(shareButtonDidTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(buttonShare)
        
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(250)
            make.width.equalTo(250)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.top.equalTo(image.snp.bottom).offset(15)
        }
        
        buttonShare.snp.makeConstraints { make in
            make.top.equalTo(label).offset(30)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func shareButtonDidTapped() {
        if let image = self.image.image {
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityController.isModalInPresentation = true
            self.present(activityController, animated: true, completion: nil)
        }
    }
}
