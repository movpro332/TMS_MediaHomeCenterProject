//
//  MediaCardView.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 05.06.2022.
//

import UIKit

class MediaCardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        descriptionTextView.isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isUserInteractionEnabled = true
        [headerLabel, coverArt, nameLabel, authorLabel, yearLabel, descriptionTextView].forEach {stack.addArrangedSubview($0)}
        return stack
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Альбом"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var coverArt: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dualipa")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Future Nostalgia"
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.isUserInteractionEnabled = true
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.text = "Dua Lipa"
        author.textColor = .blue
        author.font = UIFont.boldSystemFont(ofSize: 16)
        author.isUserInteractionEnabled = true
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private lazy var yearLabel: UILabel = {
        let year = UILabel()
        year.text = "2020"
        year.font = UIFont.systemFont(ofSize: 14)
        year.textColor = .magenta
        year.isUserInteractionEnabled = true
        year.translatesAutoresizingMaskIntoConstraints = false
        return year
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let description = UITextView()
        description.text = "Future Nostalgia — второй студийный альбом британской певицы Дуа Липы, вышедший 27 марта 2020 года на лейбле Warner Music. Альбом имеет поп- и диско-звучание. Пластинка получила благоприятные отзывы и стала коммерчески успешной, достигнув вершины чартов в 13 странах."
        description.textColor = .black
        description.font = UIFont.systemFont(ofSize: 12)
        description.isUserInteractionEnabled = true
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private func addSubviews() {
        addSubview(verticalStackView)
    }
    
    private func setupConstraints() {
        setupVerticalStackConstraints()
        setupDescriptionTextViewConstraints()
    }
    
    private func setupVerticalStackConstraints() {
        [
            verticalStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20),
            verticalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ].forEach{ $0.isActive = true }
    }
    
    private func setupDescriptionTextViewConstraints() {
        [
            descriptionTextView.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -30)
        ].forEach{ $0.isActive = true }
    }
}
