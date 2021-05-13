//
//  DetailFeedCollectionHeaderView.swift
//  haniProject
//
//  Created by Hani on 2021/05/05.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class DetailFeedCollectionHeaderView: UICollectionReusableView {
    
    static let viewIdentifier = "DetailFeedCollectionHeaderView"
    var db: Firestore!
    
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

    let hashTagLabel: [UILabel] = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "(이름 없음1)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return [label]
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentImageView: [UIImageView] = {
        let contentImage = UIImageView()
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        return [contentImage]
    }()
    
    let likeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = UIColor.appColor(.pastelPink)
        
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
        let imageView = UIImageView(image: UIImage(systemName: "bubble.left.fill")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = UIColor.appColor(.pastelPink)
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
        let imageView = UIImageView(image: UIImage(systemName: "eye.fill")?.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = UIColor.appColor(.pastelPink)
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
        
        addSubview(feedStackView)
        
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
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            feedStackView.topAnchor.constraint(equalTo: topAnchor),
            feedStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            feedStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with feedIdentifier: String) {
        
        db = Firestore.firestore()

        db.collection("feeds").document(feedIdentifier).getDocument{ [self] (document,error) in
            guard let document = document else { return }

            let userRef: String = document["uploadBy"] as? String ?? "asd"
            uploadAtLabel.text = (document["uploadAt"] as? Date ?? Date())?.dateToString()
            contentLabel.text = document["content"] as? String
            commentLabel.text = String(document["commentsCount"] as? Int ?? 0)
            likeLabel.text = String(document["likesCount"] as? Int ?? 0)
            viewsLabel.text = String(document["viewsCount"] as? Int ?? 0)

            db.collection("users").document(userRef).getDocument{ [self] (document,error) in
                if let document = document, document.exists {
                    self.uploadByLabel.text = document["nickname"] as? String ?? "이름 없음"
                   //cell.profileImageView.image = UIImage(systemName: document["profileImage"] as! String) ?? UIImage(systemName: "person.crop.circle.fill")
                    self.profileImageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
                }
            }
        }
    }
}
