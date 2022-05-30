//
//  BoundsTestView.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 23.05.2022.
//

import UIKit

final class BoundsTestView: UIView {
    
    private let testBoundsSubview = BoundsTestSubView()
    
    private lazy var mediaImageView1: UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 90, y: 120, width: 180, height: 180))
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "dualipa")
        return imageView
    }()
 
    private lazy var nameLabel1: UILabel = {
        let name = UILabel(frame: CGRect(x: mediaImageView1.frame.origin.x, y: mediaImageView1.frame.origin.y + 180, width: 200, height: 20))
        name.text = "Moonlight Edition"
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 16)
//        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var authorLabel1: UILabel = {
        let author = UILabel(frame: CGRect(x: nameLabel1.frame.origin.x, y: nameLabel1.frame.origin.y + nameLabel1.frame.height, width: 120, height: 20))
        author.text = "Dua Lipa"
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 14)
//        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mediaImageView1)
        addSubview(nameLabel1)
        addSubview(authorLabel1)
        addSubview(testBoundsSubview)
        configureImageTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(mediaImageWasTapped))
        mediaImageView1.addGestureRecognizer(tap)
      
    }
    
    @objc private func mediaImageWasTapped(_ gesture: UITapGestureRecognizer) {
        UIView.animateKeyframes(withDuration: 3, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33) {
                self.mediaImageView1.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33) {
                self.mediaImageView1.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33) {
                self.mediaImageView1.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0.33) {
                self.mediaImageView1.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
    })

}


}

