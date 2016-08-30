//
//  HomeViewController.swift
//  BanTang_WJ
//
//  Created by jerry on 16/8/26.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{

    var headerView:UIView! // 头部视图
    var bannerView:DCPicScrollView! // 轮播图片
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // 1. 创建顶部自定义导航栏
        
        // 2.初始化头部视图(包含轮播图、标题按钮、滚动标题view)
        self.setupHeaderView()
        // 3.创建内容tableView
        
        
    }

    override func viewWillAppear(animated: Bool) {
        // 隐藏导航栏，创建自定义导航栏
        self.navigationController?.navigationBarHidden = true
    }
    
    func setupHeaderView(){
    
        // 0.创建容器视图
        headerView = UIView()
        headerView.frame = CGRectMake(0, 0, screenW, 300)
        //headerView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(headerView)
        // 1.创建轮播图
        setupBannerView()
        // 2.创建标题button
        setupTitleButtons()
        // 3.创建标题滑动collectionView
    }
    func setupTitleButtons(){
    
        let index  = 4
        let images = ["GoodSomething","PlantingGrass","searchLarge","SignIn"]

        for i in 0..<index {

            //创建btn
            let btn = UIButton(type: .Custom)
            let col = i % index
            //let row = 1
            let btnW:CGFloat = screenW/CGFloat(index)
            let marginX = (screenW/CGFloat(index) - btnW)/2
            let marginY:CGFloat = 20
            
            btn.x = CGFloat(col) * btnW + marginX
            btn.y = CGRectGetMaxY(bannerView.frame) + marginY
            btn.tag = i
            btn.setImage(UIImage(named: images[i]), forState: .Normal)
            btn.size = (btn.currentImage?.size)!
            btn.adjustsImageWhenHighlighted = false // 点击时禁止高亮效果
            
            headerView.addSubview(btn)
            
        }

    }
    func setupBannerView(){
    
        let imgs = ["http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150717/ersqeu575.jpg-w720","http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150729/ipds0i95t.jpg-w720"]
        bannerView = DCPicScrollView(frame: CGRectMake(0, -20, screenW, 170), withImageUrls: imgs)
            // 图片点击回调
        bannerView.imageViewDidTapAtIndex = { (index) in
            switch index {
            case 0:
                printLog("点击图片0")
            case 1:
                printLog("点击图片1")
            default:
                break
            }
        }
        headerView.addSubview(bannerView)
    }

}
