//
//  MediaListTableViewCell.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 14.05.2022.
//

import UIKit

class MediaListTableViewCell: UITableViewCell {
    
    func update(dataModel: Media) {
        mediaImageView1.image = dataModel.mediaCover
        nameLabel1.text = dataModel.mediaName
        authorLabel1.text = dataModel.mediaAuthor
    }
    
    weak var delegate: MediaListActions?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mediaImageView1.isUserInteractionEnabled = true
//        mediaImageView2.isUserInteractionEnabled = true
        isFullSizeState = true
    }
    
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
        [verticalStackView1].forEach {stack.addArrangedSubview($0)}
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    private lazy var verticalStackView1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isUserInteractionEnabled = true
        [mediaImageView1, nameLabel1, authorLabel1].forEach {stack.addArrangedSubview($0)}
        return stack
        
    } ()
   
    private lazy var mediaImageView1: UIImageView = {
    let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
 
    private lazy var nameLabel1: UILabel = {
        let name = UILabel()
        name.text = ""
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var authorLabel1: UILabel = {
        let author = UILabel()
        author.text = ""
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 14)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
//    private lazy var verticalStackView2: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 2
//        stack.alignment = .leading
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.isUserInteractionEnabled = true
//        [mediaImageView2, nameLabel2, authorLabel2].forEach {stack.addArrangedSubview($0)}
//        return stack
//
//    } ()
//
//    private lazy var mediaImageView2: UIImageView = {
//    let imageView = UIImageView(image: UIImage(named: "dualipa"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.isUserInteractionEnabled = true
//        return imageView
//    }()
//
//    private lazy var nameLabel2: UILabel = {
//        let name = UILabel()
//        name.text = "Moonlight Edition"
//        name.textColor = .black
//        name.font = UIFont.boldSystemFont(ofSize: 16)
//        name.translatesAutoresizingMaskIntoConstraints = false
//        return name
//    }()
//
//    private lazy var authorLabel2: UILabel = {
//        let author = UILabel()
//        author.text = "Dua Lipa"
//        author.textColor = .black
//        author.font = UIFont.systemFont(ofSize: 14)
//        author.translatesAutoresizingMaskIntoConstraints = false
//        return author
//    }()


    private func setupConstraints(){
        setupVerticalStack1Constraints()
        setupStackview1SubviewsConstraints()
        setupHorizontalStackConstraints()
//        setupVerticalStack2Constraints()
//        setupStackview2SubviewsConstraints()
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
    private func setupVerticalStack1Constraints(){
        [
            verticalStackView1.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 0),
            
        ].forEach{ $0.isActive = true }
    }
    
    private func setupStackview1SubviewsConstraints() {
        [
            mediaImageView1.widthAnchor.constraint(equalToConstant: 120),
            mediaImageView1.heightAnchor.constraint(equalToConstant: 120),
            authorLabel1.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 0),
            authorLabel1.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor, constant: 0)
        ].forEach{ $0.isActive = true }
    }
    
//    private func setupVerticalStack2Constraints(){
//        [
//            verticalStackView2.topAnchor.constraint(equalTo: horizontalStackView.topAnchor, constant: 0),
//
//        ].forEach{ $0.isActive = true }
//    }
//    
//    private func setupStackview2SubviewsConstraints() {
//        [
//            mediaImageView2.widthAnchor.constraint(equalToConstant: 120),
//            mediaImageView2.heightAnchor.constraint(equalToConstant: 120),
//            mediaImageView2.topAnchor.constraint(equalTo: verticalStackView2.topAnchor, constant: 0),
//            authorLabel2.bottomAnchor.constraint(equalTo: verticalStackView2.bottomAnchor, constant: 12)
//        ].forEach{ $0.isActive = true }
//    }
//    
    private var isFullSizeState = true
    var halfConstraints: [NSLayoutConstraint] = []
    var fullConstraints: [NSLayoutConstraint] = []
    
    private func activateConstraints(isFullSize: Bool) {
        fullConstraints.forEach { $0.isActive = isFullSizeState }
        halfConstraints.forEach { $0.isActive = !isFullSizeState }
//        self.contentView.layoutIfNeeded()
    }
     
    private func setupVariableConstraints() {
        let fullHeightConstraint = mediaImageView1.heightAnchor.constraint(equalToConstant: 120)
        let fullWidthConstraint = mediaImageView1.widthAnchor.constraint(equalToConstant: 120)
        let fullTopConstraint = mediaImageView1.topAnchor.constraint(equalTo: verticalStackView1.topAnchor, constant: 0)
        
        fullConstraints.append(fullWidthConstraint)
        fullConstraints.append(fullHeightConstraint)
        fullConstraints.append(fullTopConstraint)
        
        let halfWIdthConstraint = mediaImageView1.widthAnchor.constraint(equalToConstant: 60)
        let halfHeightConstraint = mediaImageView1.heightAnchor.constraint(equalToConstant: 60)
        let halfXConstraint = mediaImageView1.centerXAnchor.constraint(equalTo: verticalStackView1.centerXAnchor)
        let halfTopConstraint = mediaImageView1.topAnchor.constraint(equalTo: verticalStackView1.topAnchor, constant: 30)
        
        halfConstraints.append(halfHeightConstraint)
        halfConstraints.append(halfWIdthConstraint)
        halfConstraints.append(halfXConstraint)
        halfConstraints.append(halfTopConstraint)
        
    }
    
    private func configureImageTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(mediaImageWasTapped))
        mediaImageView1.addGestureRecognizer(tap)
        print("image did tap")
    }
    
    @objc private func mediaImageWasTapped(_ gesture: UITapGestureRecognizer) {
        isFullSizeState.toggle()
        activateConstraints(isFullSize: isFullSizeState)
        delegate?.imageTap()
    }
}

