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
        let imageView = UIImageView(frame: CGRect(x: 120, y: 120, width: 120, height: 120))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "dualipa")
        return imageView
    }()
 
    private lazy var nameLabel1: UILabel = {
        let name = UILabel(frame: CGRect(x: mediaImageView1.frame.origin.x, y: mediaImageView1.frame.origin.y + 120, width: 200, height: 20))
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
        testBoundsSubview.frame = CGRect(x: 150, y: 300, width: 120, height: 120)
        testBoundsSubview.backgroundColor = .yellow.withAlphaComponent(0.7)
        print(nameLabel1.frame)
        print(nameLabel1.bounds)
        print(authorLabel1.frame.origin)
        print(authorLabel1.bounds.origin)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitTestView = super.hitTest(point, with: event)
        print("\(String(describing: hitTestView))")
        print("\(point)")
        return hitTestView
    }
    


}


