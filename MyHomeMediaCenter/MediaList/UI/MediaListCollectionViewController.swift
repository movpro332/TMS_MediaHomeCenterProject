//
//  MediaListCollectionViewController.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 06.06.2022.
//

import UIKit


class MediaListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (UIScreen.main.bounds.width - 70) / 5, height: 66)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        24
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(MediaListCollectionViewCell.self, forCellWithReuseIdentifier: "MediaListCollectionViewCell")
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "MediaListCollectionViewCell", for: indexPath) as? MediaListCollectionViewCell)!
        return cell
    }
}
