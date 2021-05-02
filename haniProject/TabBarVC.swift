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
       
        let firstVC = FeedVC()
        let secondNC = RoomVC()
        let thirdVC = RoutineVC()
        let fourthNC = GraphVC()
        let fifthNC = SettingVC()
       
        self.viewControllers = [firstVC, secondNC, thirdVC, fourthNC, fifthNC]
       
        let firstTabBarItem = UITabBarItem(title: "피드", image: UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal))
        let secondTabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "bubble.left.and.bubble.right")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: "bubble.left.and.bubble.right.fill")?.withRenderingMode(.alwaysOriginal))
        let thirdTabBarItem = UITabBarItem(title: "오늘의 루틴", image: UIImage(systemName: "pencil.circle")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: "pencil.circle.fill")?.withRenderingMode(.alwaysOriginal))
        let fourthTabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "book")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: "book.fill")?.withRenderingMode(.alwaysOriginal))
        let fifthTabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "person")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal))
        
        firstVC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdVC.tabBarItem = thirdTabBarItem
        fourthNC.tabBarItem = fourthTabBarItem
        fifthNC.tabBarItem = fifthTabBarItem
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        self.selectedIndex = 0
        

        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
           
           guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
                     return
                 }
           
           performSpringAnimation(imgView: imageView)
       }
       
       //이미지뷰에 스프링 애니메이션 적용하기
       func performSpringAnimation(imgView: UIImageView) {
           
           UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
               
               imgView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
               
               UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                   imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
               }) { (flag) in
               }
           }) { (flag) in
               
           }
       }
}
