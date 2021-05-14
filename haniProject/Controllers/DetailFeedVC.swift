//
//  DetailFeedVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/03.
//

import UIKit

import FirebaseFirestore

class DetailFeedVC: UIViewController {
    
    var feedIdentifier: String = "getFromFeedVC"
    var comments: [Comment] = []
    let db = Firestore.firestore()
    
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
    
    let optionMenu: UIAlertController = {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        
        let deleteAction = UIAlertAction(title: "대화하기", style: .default) {
            (action) in
            
            
            
            
            
        }
        
           let saveAction = UIAlertAction(title: "신고하기", style: .destructive) {
            (action) in

      
           }
        
        
        let ㅁction = UIAlertAction(title: "신고하기", style: .destructive) {
         (action) in
             let vc = reportVC()
             vc.modalPresentationStyle = .fullScreen
         DetailFeedVC().present(vc, animated: true)
    
   
        }
        
        
        
        
        
        
           let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
               (alert: UIAlertAction!) -> Void in
         })

           optionMenu.addAction(deleteAction)
           optionMenu.addAction(saveAction)
           optionMenu.addAction(cancelAction)
           
        return optionMenu
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "피드"
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName:"ellipsis"), style: .plain, target: self, action: #selector(rightButtonTapped))
   
        boardCollectionView.register(CommentCell.self, forCellWithReuseIdentifier: CommentCell.cellIdentifier)
        boardCollectionView.register(DetailFeedCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailFeedCollectionHeaderView.viewIdentifier)
        boardCollectionView.delegate = self
        boardCollectionView.dataSource = self
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
    

    @objc private func rightButtonTapped() {
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func reportButtonTapped(){
        let vc = reportVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
  
        
    }
    
  
}

extension DetailFeedVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
}

extension DetailFeedVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCell.cellIdentifier, for: indexPath) as? CommentCell else {fatalError("qwe")}
        cell.configure(with: comments[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        
         case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailFeedCollectionHeaderView.viewIdentifier,
               for: indexPath) as? DetailFeedCollectionHeaderView else { fatalError("Invalid view type") }
            headerView.configure(with: feedIdentifier)
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            assert(false, "Invalid element type")
            
         default:
           assert(false, "Invalid element type")
         }
    }
}

extension DetailFeedVC: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
