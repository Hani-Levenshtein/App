//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FeedVC: UINavigationController, UISearchBarDelegate {

    var db: Firestore!

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

    
    }
    
    @objc private func createFeedButtonTapped(sender: UIButton!){
        print("button tapped")
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
        return cell
    }
}
