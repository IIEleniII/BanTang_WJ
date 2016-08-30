//
//  MainNavigationController.swift
//  BanTang_WJ
//
//  Created by jerry on 16/8/26.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航控制器的全局属性
        self.navigationBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: .Default)
        // 设置全局barItem 属性
        let  navBar = UINavigationBar.appearance()
        let attrs = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        navBar.titleTextAttributes = attrs
        navBar.backIndicatorImage = UIImage(named: "back")
        navBar.tintColor = UIColor.whiteColor() // 全局barItem颜色
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
