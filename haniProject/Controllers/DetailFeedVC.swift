//
//  DetailFeedVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/03.
//

import UIKit
class DetailFeedVC: UIViewController {
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let navigationItem = UINavigationItem(title: "피드")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
        navigationBar.items = [navigationItem]
        navigationBar.backgroundColor = .white
        return navigationBar
    }()
    
    let boardCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:  UIScreen.main.bounds.width, height: 50)
        flowLayout.minimumLineSpacing = 1.0
        flowLayout.minimumInteritemSpacing = 2.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.appColor(.pastelPink)
    
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.darkGray
        label.text = "(이름 없음1)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let hashTagLabel: [UILabel] = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        autoLayout()
      
    }
    
    private func addContentView(){
        view.addSubview(navigationBar)
   
        
    }
    
    
    private func autoLayout(){
        NSLayoutConstraint.activate([
           navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           navigationBar.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 44),
           navigationBar.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
           navigationBar.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor)
    
           
        ])
    }
    
    @objc private func cancelFeedButtonTapped(){
         self.dismiss(animated: true, completion: nil)
    }
    
}
