//
//  File.swift
//  haniProject
//
//  Created by Hani on 2021/03/07.
//

import UIKit
import Firebase
import FirebaseAuth

class TabBarVC : UITabBarController{
     
    let db = Firestore.firestore()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        print("MainTabBarController - viewDidLoad() called")
               
        let firstVC = RoutineVC()
        let secondNC = ChatVC()
        let thirdVC = BoardVC()
        let fourthNC = GraphVC()
        let fifthNC = SettingVC()
       
        self.viewControllers = [firstVC, secondNC, thirdVC, fourthNC, fifthNC]
       
        let firstTabBarItem = UITabBarItem(title: "오늘의 루틴", image: UIImage(systemName: "airplayaudio"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "airplayvideo"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "게시판", image: UIImage(systemName: "arrow.clockwise.icloud.fill"), tag: 2)
        let fourthTabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "arrow.down.left.video.fill"), tag: 3)
        let fifthTabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "safari.fill"), tag: 4)
           
        firstVC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdVC.tabBarItem = thirdTabBarItem
        fourthNC.tabBarItem = fourthTabBarItem
        fifthNC.tabBarItem = fifthTabBarItem
        
        self.selectedIndex = 2
    }
}
