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
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "Profile")
        profileImage.layer.cornerRadius = 10
    
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    let uploadByLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.text = "(이름 없음)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uploadAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.text = "(이름 없음1)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let hashTagLabel: [UILabel] = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
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
        let imageView = UIImageView(image: UIImage(named: "bubble.left.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    let viewsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "eye.fill"))
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


    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    private func addContentView(){
        contentView.addSubview(profileImageView)
        contentView.addSubview(uploadByLabel)
        contentView.addSubview(uploadAtLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(viewsImageView)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(likeImageView)
        contentView.addSubview(likeLabel)
        contentView.addSubview(commentImageView)
        contentView.addSubview(commentLabel)
        contentView.backgroundColor = .white
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            profileImageView.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            profileImageView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 20),
                
            uploadByLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 4),
            uploadByLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            uploadByLabel.widthAnchor.constraint(equalToConstant: 20),
            
            uploadAtLabel.leadingAnchor.constraint(equalTo: uploadByLabel.trailingAnchor, constant: 4),
            uploadAtLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            uploadAtLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 20),
            
            contentLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            viewsImageView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 4),
            viewsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            viewsLabel.leadingAnchor.constraint(equalTo: viewsImageView.trailingAnchor, constant: 4),
            viewsLabel.widthAnchor.constraint(equalToConstant: 10),
            likeImageView.leadingAnchor.constraint(equalTo: viewsLabel.trailingAnchor, constant: 4),
            likeImageView.widthAnchor.constraint(equalToConstant: 10),
            likeLabel.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 4),
            likeLabel.widthAnchor.constraint(equalToConstant: 10),
            commentImageView.leadingAnchor.constraint(equalTo: likeLabel.trailingAnchor, constant: 4),
            commentImageView.widthAnchor.constraint(equalToConstant: 10),
            commentLabel.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 4),
            commentLabel.widthAnchor.constraint(equalToConstant: 10),
        
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

