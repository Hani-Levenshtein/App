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

    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let navigationItem = UINavigationItem(title: "피드")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "탐색", style: .plain, target: self, action: #selector(searchFeedButtonTapped))
        navigationBar.tintColor = .white
        navigationBar.barTintColor = UIColor.appColor(.pastelPink)
        navigationBar.items = [navigationItem]
        navigationBar.backgroundColor = UIColor.appColor(.pastelPink)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    let boardCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:  UIScreen.main.bounds.width, height: 300)
        flowLayout.minimumLineSpacing = 1.0
        flowLayout.minimumInteritemSpacing = 2.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.appColor(.pastelPink)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let createFeedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(createFeedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.appColor(.pastelPink)
        
        boardCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.cellIdentifier)
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        addContentView()
        autoLayout()
        
        boardCollectionView.frame = view.bounds
        db = Firestore.firestore()
        db.collection("feeds").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            feeds = documents.map { queryDocumentSnapshot -> Feed in
                let data = queryDocumentSnapshot.data()
                let identifier = data["identifier"] as? String ?? "ㄴㅇㄹㅎ"
                let title = data["title"] as? String ?? "ㄴㅇㄹㅎ "
                let content = data["content"] as? String ?? "ㄴㅇㄹㅎ"
                let uploadAt = data["uploadAt"] as? Date ?? Date()
                let uploadBy = data["uploadBy"] as? String ?? "ㄴㅇㄹㅎ"
                let photo = data["photo"] as? [String] ?? []
                let hashtag = data["hashtag"] as? [String] ?? []
                let commentsCount = data["commentsCount"] as? Int ?? 0
                let likesCount = data["likesCount"] as? Int ?? 0
                let viewsCount = data["viewsCount"] as? Int ?? 0
                print(identifier)
                print(uploadAt)
                return Feed(identifier: identifier, title: title, content: content, uploadAt: uploadAt, uploadBy: uploadBy, photo: photo, hashtag: hashtag, commentsCount: commentsCount, likesCount: likesCount, viewsCount: viewsCount)
            }
            self.boardCollectionView.reloadData()
        }
        
    }
    
    private func addContentView(){
        view.addSubview(navigationBar)
        view.addSubview(createFeedButton)
        view.addSubview(boardCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        boardCollectionView.frame = view.bounds
    }
    
    private func autoLayout(){
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 44),
            navigationBar.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
       
            boardCollectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            boardCollectionView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
            boardCollectionView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            boardCollectionView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
            boardCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
           
            createFeedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150),
            createFeedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
        ])
    }
    
    @objc private func createFeedButtonTapped(sender: UIButton!){
        let vc = CreateFeedVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true, completion: nil)
    }
    
    @objc private func searchFeedButtonTapped(sender: UIButton!){
        let vc = SearchFeedVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true, completion: nil)
    }
}

extension FeedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.cellIdentifier, for: indexPath) as! FeedCell
        
        
        let ithFeed: Feed = self.feeds[indexPath.row]
        let userRef: String = ithFeed.identifier
        
        db.collection("users").document(userRef).getDocument{ (document,error) in
            if let document = document, document.exists {
                cell.uploadByLabel.text = document["nickname"] as? String ?? "fghj"
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

extension FeedVC: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  UIScreen.main.bounds.width, height: 200)
    }
}
