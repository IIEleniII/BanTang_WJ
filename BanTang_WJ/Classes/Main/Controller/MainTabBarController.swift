//
//  MainTabBarViewController.swift
//  BanTang_WJ
//
//  Created by jerry on 16/8/26.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加子控制器
        let homeVc = HomeViewController()
        self.setTabBarVC(homeVc, title: "半糖", norImg: "Home_unselected", sltImg: "Home_selected")
        let plazaVc = PlazaViewController()
        self.setTabBarVC(plazaVc, title: "广场", norImg: "Square_normal", sltImg: "Square_selected")
        
    }

    // 创建tabbarVc子控制器
    func setTabBarVC(childVc:UIViewController,title:String,norImg:String,sltImg:String){
    
        childVc.title  = title
       
        childVc.tabBarItem.image = UIImage(named: norImg)
        childVc.tabBarItem.selectedImage = UIImage(named: sltImg)
        
        var textAttrs = [String:AnyObject]()
        textAttrs[NSForegroundColorAttributeName] = RGB(123, 123, 123)
        var selectTextAttrs = [String:AnyObject]()
        selectTextAttrs[NSForegroundColorAttributeName] = UIColor.redColor()
        
        childVc.tabBarItem.setTitleTextAttributes(textAttrs, forState: .Normal)
        childVc.tabBarItem.setTitleTextAttributes(selectTextAttrs, forState: .Selected)
        let nav = MainNavigationController(rootViewController: childVc)
        self.addChildViewController(nav)
        
    }
    


}
