//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FeedVC: UINavigationController {

    var db: Firestore!
    var auth = FirebaseAuth.Auth.auth()
    var boardCollectionView: UICollectionView?
    var cellIdentifier = "FeedCell"
    var feeds: [Feed] = []
    
        
    let createFeedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowRadius = 6
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.setTitle("Butt", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(createFeedButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "게시판"
        self.navigationBar.tintColor = .black
        self.navigationBar.barTintColor = .orange
        view.addSubview(createFeedButton)
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search User"
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()

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

            self.boardCollectionView?.reloadData()
        }
        
     
        
        
    }
    
    @objc private func createFeedButtonTapped(sender: UIButton!){
        let vc = CreateFeedVC()
        vc.modalPresentationStyle = .fullScreen
        //self.navigationController?.pushViewController(vc, animated: true)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeedCell
        
        
        let ithFeed = feeds[indexPath.row]
        let userRef: String = ithFeed.identifier
        
        db.collection("users").document(userRef).getDocument{ (document,error) in
            if let document = document, document.exists {
                cell.uploadByLabel.text = document["nickname"] as? String ?? ""
                cell.profileImageView.image = UIImage(named: document["profileImage"] as! String) ?? UIImage()
            }
        }
            
        //cell.uploadAtLabel.text = dateToString(from: ithFeed.uploadAt)
        cell.uploadByLabel.text = ithFeed.uploadBy
        cell.contentLabel.text = ithFeed.content
        cell.likeLabel.text = String(ithFeed.likesCount)
        cell.viewsLabel.text = String(ithFeed.viewsCount)
        cell.commentLabel.text = String(ithFeed.commentsCount)
        //cell.hashTagLabel.text = ithFeed.hashtag
        
        return cell
    }
}
