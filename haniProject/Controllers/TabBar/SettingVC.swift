//
//  SettingVC.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit

class SettingVC: UIViewController{

    private let tableView = UITableView()
    
    let account: [String] = ["로그아웃", "회원탈퇴"]
    let notification: [String] = ["메세지 알림", "피드 알림"]
    let infomation: [String] = ["헬스장 이용규칙","앱버전","문의","이용 약관","개인정보 취급방침","오픈소스 라이센스"]
    let header: [String] = ["계정","알림","정보"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingSwitchCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingAlertCell")
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension SettingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return account.count
        case 1:
            return notification.count
        case 2:
            return infomation.count
        default:
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingAlertCell.identifier, for: indexPath) as!
                SettingAlertCell
            cell.configure(text: account[indexPath.row])
            return cell
        }
        else if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.identifier, for: indexPath) as! SettingSwitchCell
            cell.configure(text: notification[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingViewCell.identifier, for: indexPath) as!
                SettingViewCell
            cell.configure(text: infomation[indexPath.row])
            return cell
        }
      
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
}

