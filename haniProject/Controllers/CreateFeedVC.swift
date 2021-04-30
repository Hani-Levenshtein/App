//
//  createFeedVC.swift
//  haniProject
//
//  Created by Hani on 2021/04/14.
//

import UIKit
import Firebase
import FirebaseFirestore

class CreateFeedVC: UIViewController, UITextViewDelegate {
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let navigationItem = UINavigationItem(title: "글쓰기")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelFeedButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(confirmFeedButtonTapped))
        navigationBar.items = [navigationItem]
        navigationBar.backgroundColor = .white
        return navigationBar
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:25))
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 20.0)
        textField.placeholder = "제목을 입력해주세요."
        textField.textAlignment = NSTextAlignment.left
        textField.backgroundColor = .white
        return textField
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

        self.view.backgroundColor = .white
 
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
         
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        stackView.addSubview(contentTextView)
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        contentTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor).isActive = true
        contentTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 500).isActive = true
        contentTextView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
       
        contentTextView.delegate = self
    }
    
 
    @objc private func cancelFeedButtonTapped(){
        print("qweqwe")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func confirmFeedButtonTapped(){
        print("qweqw1111e")
        guard let title = titleTextField.text,
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
            hashtag: ["태그1", "태그2"],
            
            commentsCount: 0,
            likesCount: 0,
            viewsCount: 0
            
        )
        
        DatabaseManager.addFeed(feed: feed)

        
        self.dismiss(animated: true, completion: nil)
    }
}
extension CreateFeedVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == titleTextField {
            contentTextView.becomeFirstResponder()
        }
        else if textField == contentTextView {
            confirmFeedButtonTapped()
        }
        
        return true
    }
    

}
