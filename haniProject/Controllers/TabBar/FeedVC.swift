//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FeedVC: UIViewController {

    var db: Firestore!
    var auth = FirebaseAuth.Auth.auth()
    var feeds: [Feed] = []
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let navigationItem = UINavigationItem(title: "피드")
        navigationBar.tintColor = .white
        navigationBar.barTintColor = UIColor.appColor(.pastelPink)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "탐색", style: .plain, target: self, action: #selector(searchFeedButtonTapped))
        navigationBar.items = [navigationItem]
        navigationBar.backgroundColor = UIColor.appColor(.pastelPink)
        return navigationBar
    }()
    
    let boardCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    let createFeedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        //button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        //button.layer.shadowRadius = 6
        
        
        button.layer.masksToBounds = true
        
        
        
        button.clipsToBounds = true
        
        
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(createFeedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "게시판"
        view.backgroundColor = UIColor.appColor(.pastelPink)
        
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        
         
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        view.addSubview(createFeedButton)
        NSLayoutConstraint.activate([
            createFeedButton.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor, constant: -150),
            createFeedButton.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -150),
        ])
        
        
        scrollView.addSubview(boardCollectionView)
        NSLayoutConstraint.activate([
        boardCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        boardCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        boardCollectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        boardCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
     
           ])

        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        boardCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.cellIdentifier)
        
        
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        db.collection("feeds").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            feeds = documents.map { queryDocumentSnapshot -> Feed in
                let data = queryDocumentSnapshot.data()
                let identifier = data["identifier"] as? String ?? ""
                let title = data["title"] as? String ?? " "
                let content = data["content"] as? String ?? ""
                let uploadAt = data["uploadAt"] as? Date ?? Date()
                let uploadBy = data["uploadBy"] as? String ?? ""
                let photo = data["photo"] as? [String] ?? []
                let hashtag = data["hashtag"] as? [String] ?? []
                let commentsCount = data["commentsCount"] as? Int ?? 0
                let likesCount = data["likesCount"] as? Int ?? 0
                let viewsCount = data["viewsCount"] as? Int ?? 0
                return Feed(identifier: identifier, title: title, content: content, uploadAt: uploadAt, uploadBy: uploadBy, photo: photo, hashtag: hashtag, commentsCount: commentsCount, likesCount: likesCount, viewsCount: viewsCount)
            }
            self.boardCollectionView.reloadData()
        }
    }
    
    @objc private func createFeedButtonTapped(sender: UIButton!){
        let vc = CreateFeedVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true, completion: nil)
    }
    
    @objc private func searchFeedButtonTapped(sender: UIButton!){
        let vc = SearchFeedVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.cellIdentifier, for: indexPath) as! FeedCell
        
        
        let ithFeed = feeds[indexPath.row]
        let userRef: String = ithFeed.identifier
        
        db.collection("users").document(userRef).getDocument{ (document,error) in
            if let document = document, document.exists {
                cell.uploadByLabel.text = document["nickname"] as? String ?? ""
                cell.profileImageView.image = UIImage(named: document["profileImage"] as! String) ?? UIImage(named: "Profile")
            }
        }
            
        cell.uploadAtLabel.text = ithFeed.uploadAt.dateToString()
        cell.contentLabel.text = ithFeed.content
        cell.likeLabel.text = String(ithFeed.likesCount)
        cell.viewsLabel.text = String(ithFeed.viewsCount)
        cell.commentLabel.text = String(ithFeed.commentsCount)
        
        //cell.hashTagLabel.text = ithFeed.hashtag
        
        return cell
    }
    
  
}
