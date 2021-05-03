//
//  SettingVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Firebase
class SettingVC: UIViewController {

    private let tableView = UITableView()
   
    
    let account: [String] = ["로그아웃", "회원탈퇴"]
    let alarm: [String] = ["메세지 알림", "피드 알림"]
    let infomation: [String] = ["앱버전","문의하기","이용 약관","개인정보 취급방침","오픈소스 라이센스"]
    let sections: [String] = ["계정","알림","정보"]
    
    let tableViewHeaderView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        let underLine = UIView()
        underLine.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        //view.backgroundColor = UIColor.appColor(.pastelPink)
        view.backgroundColor = .white
        let profileImg = UIImageView(image: UIImage(systemName: "profile.fill"))
        let nickLabel = UILabel()
        let db = Firestore.firestore()
        var userRef = Auth.auth().currentUser!.uid
        db.collection("users").document(userRef).getDocument { (document, error) in
            if let document = document, document.exists {
                nickLabel.text = document.get("nickname") as? String ?? "sdfg"
            } else {
            }
        }

        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeProfileButtonTapped))
        view.addGestureRecognizer(gesture)
        view.layer.borderWidth=2
        view.addSubview(underLine)
        view.addSubview(profileImg)
        view.addSubview(nickLabel)
        
        nickLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        underLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            profileImg.widthAnchor.constraint(equalToConstant: 60),
            profileImg.heightAnchor.constraint(equalToConstant: 60),
            profileImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nickLabel.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 13),
            nickLabel.centerYAnchor.constraint(equalTo: profileImg.centerYAnchor),
            
            underLine.heightAnchor.constraint(equalToConstant: 0.5),
            underLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            underLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            underLine.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.tableHeaderView = tableViewHeaderView
        tableView.register(SettingAccountCell.self, forCellReuseIdentifier: SettingAccountCell.cellIdentifier)
        tableView.register(SettingInfoCell.self, forCellReuseIdentifier: SettingInfoCell.cellIdentifier)
        tableView.register(SettingAlertCell.self, forCellReuseIdentifier: SettingAlertCell.cellIdentifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func changeProfileButtonTapped(sender: UIButton!){
        let vc = ProfileChangeVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: true, completion: nil)
    }
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return account.count
        case 1:
            return alarm.count
        case 2:
            return infomation.count
        default:
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingAccountCell.cellIdentifier, for: indexPath) as!
                SettingAccountCell
            cell.configure(text: account[indexPath.row])
            return cell
        }
        else if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingAlertCell.cellIdentifier, for: indexPath) as! SettingAlertCell
            cell.configure(text: alarm[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingInfoCell.cellIdentifier, for: indexPath) as!
                SettingInfoCell
            cell.configure(text: infomation[indexPath.row])
            return cell
        }
      
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 20
    }
}

