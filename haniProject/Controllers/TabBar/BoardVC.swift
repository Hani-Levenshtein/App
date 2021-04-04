//
//  BoardVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class BoardVC: UIViewController {
    
    var db: Firestore!

    var boardCollectionView: UICollectionView!
        var cellId = "FeedCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 700)

        boardCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        boardCollectionView.dataSource = self
        boardCollectionView.delegate = self
        
        boardCollectionView.showsVerticalScrollIndicator = false
        self.view.addSubview(boardCollectionView)

    }
}

extension BoardVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
 
}
