//
//  MessageCell.swift
//  haniProject
//
//  Created by Hani on 2021/03/08.
//


import UIKit

class MessageCell:  UICollectionViewCell {

    static let cellIdentifier = "MessageCell"

    let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let uploadByLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-70, height: 70))
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uploadAtLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 70))
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 3
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
        
        stackView.layer.cornerRadius = 20
        stackView.layer.shadowColor = UIColor(hex: 0xD1CDC7, alpha: 0.5).cgColor
        stackView.layer.shadowOpacity = 1.0
        stackView.layer.shadowOffset = CGSize(width: 6, height: 6)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        autoLayout()
    }
    
    
    
    private func addContentView(){
        
        contentView.addSubview(feedStackView)
   
        feedStackView.addArrangedSubview(profileImageView)
        feedStackView.addArrangedSubview(uploadByLabel)
        feedStackView.addArrangedSubview(uploadAtLabel)
        feedStackView.addArrangedSubview(contentLabel)
   
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
            feedStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            feedStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            feedStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            feedStackView.widthAnchor.constraint(equalToConstant: contentView.width - 50)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

 
    public func configure(_ message: Message) {
        
        
    }
    

}
