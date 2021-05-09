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

    let boardCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:  UIScreen.main.bounds.width, height: 150)
        flowLayout.minimumLineSpacing = 1.0
        flowLayout.minimumInteritemSpacing = 2.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    
        return collectionView
    }()
    
    let createFeedButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.appColor(.pastelPink)
        button.addTarget(self, action: #selector(createFeedButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "피드"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "탐색", style: .plain, target: self, action: #selector(searchFeedButtonTapped))
        
        self.navigationController?.navigationBar.tintColor = UIColor.appColor(.pastelPink)
        self.navigationController?.navigationBar.barTintColor = .white
        
        boardCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.cellIdentifier)
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
        
        addContentView()
        autoLayout()
        configure()
    }
    
    private func configure(){
        db = Firestore.firestore()
        db.collection("feeds").addSnapshotListener { [self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else { return }
            
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
    
                return Feed(identifier: identifier, title: title, content: content, uploadAt: uploadAt, uploadBy: uploadBy, photo: photo, hashtag: hashtag, commentsCount: commentsCount, likesCount: likesCount, viewsCount: viewsCount)
            }
            self.boardCollectionView.reloadData()
        }
    }
    
    private func addContentView(){
 
        view.addSubview(boardCollectionView)
        boardCollectionView.addSubview(createFeedButton)
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
     
            boardCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            boardCollectionView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
            boardCollectionView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            boardCollectionView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
            boardCollectionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
           
            createFeedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            createFeedButton.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: -60),
            createFeedButton.widthAnchor.constraint(equalToConstant: 50),
            createFeedButton.heightAnchor.constraint(equalToConstant: 50)
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
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
}

extension FeedVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.cellIdentifier, for: indexPath) as? FeedCell else { fatalError("FeedVC CollectionViewCell Failed") }
        cell.configure(with: feeds[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailFeedVC()
        vc.feedIdentifier = feeds[indexPath.row].identifier
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension FeedVC: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView.frame.width, height: 150)
    }
}
