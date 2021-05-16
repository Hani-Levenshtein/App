//
//  messageVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/14.
//

import UIKit
import Firebase
import FirebaseFirestore

class MessageVC: UIViewController {
    
    var room: String? = nil
    var messages: [Message] = []
    let db = Firestore.firestore()
    
    let boardCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width:  UIScreen.main.bounds.width, height: 50)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
  
        addContentView()
        autoLayout()
    }

    private func addContentView() {
        view.addSubview(boardCollectionView)
        
    }
    
    private func autoLayout() {
        NSLayoutConstraint.activate([
            boardCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            boardCollectionView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
            boardCollectionView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            boardCollectionView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
  
    
    @objc private func cancelFeedButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension MessageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.cellIdentifier, for: indexPath) as? MessageCell else {fatalError("MessageVC CommentCell Error")}
        
        cell.configure(messages[indexPath.row])
        return cell
    }
    
}
