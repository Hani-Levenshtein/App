//
//  FeedCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    static let identifier = "FeedCell"
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.text = "(이름 없음)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let hashTagLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.appColor(.pastelPink)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.alignment = UIStackView.Alignment.center
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        return stackView
    }()

    let likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let likeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    let viewsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        autoLayout()
    }

    func addViews(){
        
        addSubview(profileImageView)
        addSubview(nickNameLabel)
        
        addSubview(contentLabel)
        addSubview(contentImageView)
        
        
        addSubview(hashTagLabel)
        addSubview(stackView)
        // Stack View
        addSubview(likeImageView)
        addSubview(likeLabel)
        addSubview(commentImageView)
        addSubview(commentLabel)
        addSubview(viewsImageView)
        addSubview(viewsLabel)
    }
    
    func autoLayout(){
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        
        nickNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 5).isActive = true
        nickNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -8).isActive = true
        
        contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        contentLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5).isActive = true
        contentLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true

        commentImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        commentImageView.topAnchor.constraint(equalTo: contentLabel.topAnchor, constant: 5).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        hashTagLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        hashTagLabel.topAnchor.constraint(equalTo: commentImageView.topAnchor, constant: 5).isActive = true
        hashTagLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        stackView.leftAnchor.constraint(equalTo: hashTagLabel.rightAnchor, constant: 5).isActive = true
        stackView.centerYAnchor.constraint(equalTo: hashTagLabel.centerYAnchor, constant: -8).isActive = true

        stackView.addArrangedSubview(likeImageView)
        stackView.addArrangedSubview(likeLabel)
        stackView.addArrangedSubview(commentImageView)
        stackView.addArrangedSubview(commentLabel)
        stackView.addArrangedSubview(viewsImageView)
        stackView.addArrangedSubview(viewsLabel)
    
        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
