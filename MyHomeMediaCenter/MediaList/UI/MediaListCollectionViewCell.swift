//
//  MediaListCollectionViewCell.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 06.06.2022.
//

import UIKit

final class MediaListCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isUserInteractionEnabled = true
        [mediaImageView, nameLabel, authorLabel].forEach {stack.addArrangedSubview($0)}
        return stack
        
    } ()
   
    private lazy var mediaImageView: UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: "dualipa")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
 
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Moonlight Edition"
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 6)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.text = "Dua Lipa"
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 4)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
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
    private extension MediaListCollectionViewCell {
        func addSubviews() {
            contentView.addSubview(verticalStackView)
        }
        
        func setupConstraints() {
            [
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mediaImageView.widthAnchor.constraint(equalToConstant: 50),
            mediaImageView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach{ $0.isActive = true }
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

