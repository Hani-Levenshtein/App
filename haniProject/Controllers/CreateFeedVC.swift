//
//  createFeedVC.swift
//  haniProject
//
//  Created by Hani on 2021/04/14.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateFeedVC: UINavigationController, UITextViewDelegate {
    
    private let titleTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:30))
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.font = UIFont.systemFont(ofSize: 20.0)
        textView.text = "제목을 입력해주세요."
       textView.textAlignment = NSTextAlignment.left
        textView.backgroundColor = .white
        return textView
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.text = "내용을 입력해주세요."
        textView.font = UIFont.systemFont(ofSize: 20.0)
       textView.textAlignment = NSTextAlignment.left
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = .black
        self.navigationBar.barTintColor = .orange
        self.view.backgroundColor = .white
        self.navigationItem.title = "글쓰기"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(confirmFeedButtonTapped))
        
        self.navigationBar.tintColor = .black
        self.navigationBar.barTintColor = .orange
      
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        view.addSubview(scrollView)
        
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        scrollView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.addSubview(titleTextView)
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        titleTextView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        titleTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        titleTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackView.addSubview(contentTextView)
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor).isActive = true
        contentTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 500).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
       
        titleTextView.delegate = self
        contentTextView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        scrollView.isUserInteractionEnabled = true
    }
    @objc private func cancelFeedButtonTapped(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func confirmFeedButtonTapped(){
        
        guard let title = titleTextView.text,
              let content = contentTextView.text
              else {return }
        
        let db = Firestore.firestore()
        let userIdentifier: String = Auth.auth().currentUser?.uid ?? ""
        let roomIdentifier: String = db.collection("Rooms").document().documentID

        let feed = Feed(
            identifier: roomIdentifier,
            
            title: title,
            content: content,
            
            uploadAt: Date(),
            uploadBy: userIdentifier,

            photo: [],
            hashtag: ["태그1", "태그2"]
        )
        
        DatabaseManager.addFeed(feed: feed)

        
        self.dismiss(animated: true, completion: nil)
    }
}
extension CreateFeedVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == titleTextView {
            contentTextView.becomeFirstResponder()
        }
        else if textField == contentTextView {
            confirmFeedButtonTapped()
        }
        
        return true
    }
    

}
