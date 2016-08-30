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
            // 首页
        self.setTabBarVC(HomeViewController(), title: "半糖", norImg: "TabBar_home~iphone", sltImg:"TabBar_home_selected~iphone" )
            // 广场
        self.setTabBarVC(PlazaViewController(), title: "广场", norImg:"TabBar_category~iphone" , sltImg: "TabBar_category_Selected~iphone")
            // 秀
        self.setTabBarVC(ShowViewController(), title: "秀", norImg:"tabbar_compose_icon_add", sltImg: "tabbar_compose_icon_add_highlighted")
        
            // 通知
        self.setTabBarVC(NotificationViewController(), title: "通知", norImg: "tabbar_message_center", sltImg: "tabbar_message_center_selected")
            // 个人中心
        self.setTabBarVC(ProfileViewController(), title: "我的", norImg: "TabBar_me_boy~iphone", sltImg: "TabBar_me_boy_selected~iphone")
        
    }

    // 创建tabbarVc子控制器
    func setTabBarVC(childVc:UIViewController,title:String,norImg:String,sltImg:String){
    
        childVc.title  = title
       
        childVc.tabBarItem.image = UIImage(named: norImg)
        childVc.tabBarItem.selectedImage = UIImage(named: sltImg)?.imageWithRenderingMode(.AlwaysOriginal)
        
        var textAttrs = [String:AnyObject]()
        textAttrs[NSForegroundColorAttributeName] = RGB(123, 123, 123)
        var selectTextAttrs = [String:AnyObject]()
        selectTextAttrs[NSForegroundColorAttributeName] = RGB(242, 80, 80)
        
        childVc.tabBarItem.setTitleTextAttributes(textAttrs, forState: .Normal)
        childVc.tabBarItem.setTitleTextAttributes(selectTextAttrs, forState: .Selected)
        let nav = MainNavigationController(rootViewController: childVc)
        self.addChildViewController(nav)
        
    }
    


}
