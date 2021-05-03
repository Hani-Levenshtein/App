//
//  FeedCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore

class FeedCell: UICollectionViewCell {
    
    static let cellIdentifier = "FeedCell"
    var db = Firestore.firestore()
   
    let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let uploadByLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uploadAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let hashTagLabel: [UILabel] = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.black
        label.text = "(이름 없음1)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return [label]
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentImageView: [UIImageView] = {
        let contentImage = UIImageView()
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        return [contentImage]
    }()
    
    let likeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let likeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let commentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "bubble.left.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    let viewsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "eye.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let feedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = . white
        return stackView
    }()
    
    let feedInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let countStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        
        contentView.addSubview(feedStackView)
        
        feedStackView.addArrangedSubview(feedInfoStackView)
        feedStackView.addArrangedSubview(contentStackView)
        feedStackView.addArrangedSubview(countStackView)
        
        feedInfoStackView.addArrangedSubview(profileImageView)
        feedInfoStackView.addArrangedSubview(uploadByLabel)
        feedInfoStackView.addArrangedSubview(uploadAtLabel)
 
        contentStackView.addArrangedSubview(contentLabel)
        //contentStackView.addArrangedSubview(commentImageView)
       
        countStackView.addArrangedSubview(viewsImageView)
        countStackView.addArrangedSubview(viewsLabel)
        countStackView.addArrangedSubview(likeImageView)
        countStackView.addArrangedSubview(likeLabel)
        countStackView.addArrangedSubview(commentImageView)
        countStackView.addArrangedSubview(commentLabel)
        
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
            feedStackView.topAnchor.constraint(equalTo: topAnchor),
            feedStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            feedStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
           
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

