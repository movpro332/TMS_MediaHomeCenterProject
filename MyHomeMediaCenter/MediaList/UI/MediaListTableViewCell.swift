//
//  MediaListTableViewCell.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 14.05.2022.
//

import UIKit

class MediaListTableViewCell: UITableViewCell {
    
    func update(dataModel: Media) {
        mediaImageView.image = dataModel.mediaCover
        nameLabel.text = dataModel.mediaName
        authorLabel.text = dataModel.mediaAuthor
    }
    
    weak var delegate: MediaListActions?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        addSubviews()
        setupConstraints()
        configureImageTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(horizontalStackView)
    }
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 48
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [verticalStackView].forEach {stack.addArrangedSubview($0)}
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
 
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = ""
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.text = ""
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 14)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private func setupConstraints(){
        setupVerticalStackConstraints()
        setupStackviewSubviewsConstraints()
        setupHorizontalStackConstraints()
        setupVariableConstraints()
        activateConstraints(isFullSize: true)
}

    private func setupHorizontalStackConstraints(){
        [
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        horizontalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ].forEach{ $0.isActive = true}
    }
    private func setupVerticalStackConstraints(){
        [
            verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 0),
            
        ].forEach{ $0.isActive = true }
    }
    
    private func setupStackviewSubviewsConstraints() {
        [
            mediaImageView.widthAnchor.constraint(equalToConstant: 180),
            mediaImageView.heightAnchor.constraint(equalToConstant: 180),
            authorLabel.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 0),
            authorLabel.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 0),
        ].forEach{ $0.isActive = true }
    }
    
//
    private var isFullSizeState = true
    var halfConstraints: [NSLayoutConstraint] = []
    var fullConstraints: [NSLayoutConstraint] = []
    
    private func activateConstraints(isFullSize: Bool) {
        fullConstraints.forEach { $0.isActive = isFullSizeState }
        halfConstraints.forEach { $0.isActive = !isFullSizeState }
    }
     
    private func setupVariableConstraints() {
        let fullHeightConstraint = mediaImageView.heightAnchor.constraint(equalToConstant: 180)
        let fullWidthConstraint = mediaImageView.widthAnchor.constraint(equalToConstant: 180)
        let fullTopConstraint = mediaImageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0)
        
        fullConstraints.append(fullWidthConstraint)
        fullConstraints.append(fullHeightConstraint)
        fullConstraints.append(fullTopConstraint)
        
        let halfWIdthConstraint = mediaImageView.widthAnchor.constraint(equalToConstant: 120)
        let halfHeightConstraint = mediaImageView.heightAnchor.constraint(equalToConstant: 120)
        let halfXConstraint = mediaImageView.centerXAnchor.constraint(equalTo: verticalStackView.centerXAnchor)
        let halfTopConstraint = mediaImageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 30)
        
        halfConstraints.append(halfHeightConstraint)
        halfConstraints.append(halfWIdthConstraint)
        halfConstraints.append(halfXConstraint)
        halfConstraints.append(halfTopConstraint)
        
    }
    
    private func configureImageTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(mediaImageWasTapped))
        mediaImageView.addGestureRecognizer(tap)
        print("image did tap")
    }
    
    @objc private func mediaImageWasTapped(_ gesture: UITapGestureRecognizer) {
        isFullSizeState.toggle()
        activateConstraints(isFullSize: isFullSizeState)
        UIView.animate(withDuration: 0.25, delay: .zero, options: [.curveEaseIn, .curveEaseOut]) {
            self.layoutIfNeeded()
        }
        delegate?.imageTap()
    }
}

