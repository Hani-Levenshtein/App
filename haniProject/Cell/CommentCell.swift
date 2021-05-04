//
//  CommentCell.swift
//  haniProject
//
//  Created by Hani on 2021/05/04.
//
import UIKit
import FirebaseFirestore

class CommentCell: UICollectionViewCell {
    
    static let cellIdentifier = "CommentCell"
    var db = Firestore.firestore()
   
    let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
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
        label.numberOfLines = 4
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
    
    public func configure(with model: Comment) {
        
          let userRef: String = model.sentBy
        
        db.collection("users").document(userRef).getDocument{ [self] (document,error) in
            if let document = document, document.exists {
                self.uploadByLabel.text = document["nickname"] as? String ?? "이름 없음"
               //cell.profileImageView.image = UIImage(systemName: document["profileImage"] as! String) ?? UIImage(systemName: "person.crop.circle.fill")
                self.profileImageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
            }
        }
        uploadAtLabel.text = model.sentAt.dateToString()
        contentLabel.text = model.content
    }
  
}

