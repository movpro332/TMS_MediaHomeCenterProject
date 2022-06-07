//
//  MediaListTestViewController.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 06.06.2022.
//

import UIKit

final class ContainerView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 70) / 5, height: 66)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ContainerView {
    func addSubviews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        [
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 66)
        ].forEach{ $0.isActive = true }
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}


class MediaListTestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaListCollectionViewCell", for: indexPath) as! MediaListCollectionViewCell
        return cell
    }
    
    
    private let customView = ContainerView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.collectionView.register(MediaListCollectionViewCell.self, forCellWithReuseIdentifier: "MediaListCollectionViewCell")
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }
    
    
    
    
}
