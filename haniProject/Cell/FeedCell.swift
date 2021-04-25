//
//  FeedCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore

class FeedCell: UICollectionViewCell {
    
    static let identifier = "FeedCell"
    let db = Firestore.firestore()
    
    let contentStackView: UIStackView = {
        let contentStackView = UIStackView()
        contentStackView.axis  = NSLayoutConstraint.Axis.vertical
        contentStackView.alignment = UIStackView.Alignment.center
        contentStackView.distribution = UIStackView.Distribution.fillEqually
        contentStackView.translatesAutoresizingMaskIntoConstraints = false;
        return contentStackView
    }()
    
    let profileImageView: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "Profile")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()

    let nicknameLabel: UILabel = {
        let nickname = UILabel()
        nickname.font = UIFont.systemFont(ofSize: 12)
        nickname.textColor = UIColor.darkGray
        nickname.text = "(이름 없음)"
        nickname.translatesAutoresizingMaskIntoConstraints = false
        return nickname
    }()
    
    let uploadTimeLabel: UILabel = {
        
        let uploadTime = UILabel()
        uploadTime.font = UIFont.systemFont(ofSize: 12)
        uploadTime.textColor = UIColor.darkGray
        uploadTime.text = "(이름 없음1)"
        uploadTime.translatesAutoresizingMaskIntoConstraints = false

        return uploadTime
    }()
        
    
    class hashTagViewController: UIViewController {
        
    }
    
    
    
    
    let hashTagLabel: UILabel = {
        let hashTag = UILabel()
        hashTag.textColor = UIColor.appColor(.pastelPink)
        hashTag.font = UIFont.systemFont(ofSize: 14)
        hashTag.translatesAutoresizingMaskIntoConstraints = false
        return hashTag
    }()
    
    let contentLabel: UILabel = {
        let content = UILabel()
        content.textColor = UIColor.lightGray
        content.font = UIFont.systemFont(ofSize: 14)
        content.text = ""
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    let contentImageView: UIImageView = {
        let contentImage = UIImageView()
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        return contentImage
    }()

    let valueStackView: UIStackView = {
        let valueStackView = UIStackView()
        valueStackView.axis  = NSLayoutConstraint.Axis.horizontal
        valueStackView.alignment = UIStackView.Alignment.leading
        valueStackView.distribution = UIStackView.Distribution.fillEqually
        valueStackView.translatesAutoresizingMaskIntoConstraints = false;
        return valueStackView
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
        
 
        valueStackView.addSubview(likeImageView)
        valueStackView.addSubview(likeLabel)
        valueStackView.addSubview(commentImageView)
        valueStackView.addSubview(commentLabel)
        valueStackView.addSubview(viewsImageView)
        valueStackView.addSubview(viewsLabel)
        
        
        contentStackView.addSubview(contentLabel)
        //contentStackView.addSubview(contentImageView)
        
        addSubview(profileImageView)
        addSubview(nicknameLabel)
        addSubview(uploadTimeLabel)
        addSubview(valueStackView)
        addSubview(contentStackView)

        
    }
    
    func autoLayout(){
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true

        uploadTimeLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        uploadTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        nicknameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor).isActive = true
        nicknameLabel.rightAnchor.constraint(equalTo: uploadTimeLabel.leftAnchor).isActive = true
        
        valueStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        valueStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  
        contentStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: valueStackView.topAnchor).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

