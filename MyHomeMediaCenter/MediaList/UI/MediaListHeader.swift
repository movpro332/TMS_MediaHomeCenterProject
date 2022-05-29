//
//  MediaListHeader.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 14.05.2022.
//

import UIKit

class MediaListHeader: UIView {

   private let headerLabel = UILabel()
    var title: String? {
        get { headerLabel.text}
        set { headerLabel.text = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MediaListHeader {
    func setupUI() {
        addSubviews()
        configureLabel()
        setupConstraints()
    }
    
    private func addSubviews(){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(headerLabel)
    }
    
    private func setupConstraints() {
        [
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
        headerLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 48)
        ].forEach{ $0.isActive = true }
    }
    
    private func configureLabel() {
        headerLabel.numberOfLines = 1
        headerLabel.textColor = .black
        headerLabel.font = .boldSystemFont(ofSize: 28)
        headerLabel.backgroundColor = .white
    }
}

