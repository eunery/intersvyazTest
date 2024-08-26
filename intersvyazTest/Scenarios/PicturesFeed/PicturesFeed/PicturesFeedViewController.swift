//
//  PicturesFeedViewController.swift
//  intersvyazTest
//
//  Created by Sergei Kulagin on 21.08.2024.
//

import Foundation
import UIKit
import Resolver
import SnapKit

class PicturesFeedViewController: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: PicturesFeedCoordinatorProtocol?
    @Injected var viewModel: PicturesFeedViewModelProtocol
    
    // MARK: - Private Properties
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let inset: CGFloat = 16
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 14
        flowLayout.sectionInset = UIEdgeInsets(top: 0,
                                               left: inset * 2,
                                               bottom: 0,
                                               right: inset * 2)
        
        let item = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        item.showsHorizontalScrollIndicator = false
        return item
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.viewModel.fetchData {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
        self.setupLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        self.collectionView.register(PicturesFeedCollectionViewCell.self,
                                forCellWithReuseIdentifier: PicturesFeedCollectionViewCell.reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension PicturesFeedViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension PicturesFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.dataSource.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: PicturesFeedCollectionViewCell.reuseIdentifier,
        for: indexPath) as? PicturesFeedCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(image: self.viewModel.dataSource[indexPath.row].image, name: self.viewModel.dataSource[indexPath.row].name)
        cell.delegate = self
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PicturesFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellsPerRow: CGFloat = 2
            let padding: CGFloat = 50
            let cellWidth = (collectionView.bounds.width / cellsPerRow ) - padding
            let cellHeight: CGFloat = 150
            return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - PicturesFeedCollectionViewCellDelegate
extension PicturesFeedViewController: PicturesFeedCollectionViewCellDelegate {
    func imageDidTapped(image: UIImage, name: String) {
        self.coordinator?.openPicture(image: image, name: name)
    }
}
