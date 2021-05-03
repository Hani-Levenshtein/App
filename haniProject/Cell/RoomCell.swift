//
//  RoomCell.swift
//  haniProject
//
//  Created by Hani on 2021/04/06.
//

import UIKit
import FirebaseFirestore

class RoomCell: UICollectionViewCell {

    static let cellIdentifier = "RoomCell"
    var db = Firestore.firestore()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let peopleCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(lastMessageLabel)
        contentView.addSubview(lastUpdateLabel)
        contentView.addSubview(peopleCountLabel)
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
                
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 20),
            
            peopleCountLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            peopleCountLabel.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 20),
            peopleCountLabel.widthAnchor.constraint(equalToConstant: 20),
            
            lastUpdateLabel.leadingAnchor.constraint(equalTo: peopleCountLabel.trailingAnchor, constant: 4),
            lastUpdateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            lastUpdateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 20),
            
            lastMessageLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),
            lastMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
