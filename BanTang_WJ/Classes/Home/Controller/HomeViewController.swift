//
//  HomeViewController.swift
//  BanTang_WJ
//
//  Created by jerry on 16/8/26.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIScrollViewDelegate,TitleViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate{

    var headerView:UIView! // 头部视图
    var bannerView:DCPicScrollView! // 轮播图片
    var titleScrollView:TitleView! //滑动标题
    var contentView:UICollectionView! //内容视图
    var titleArr:[String]! //存放标题文字字符串
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // 1. 创建顶部自定义导航栏
        
        // 2.初始化头部视图(包含轮播图、标题按钮、滚动标题view)
        setupHeaderView()
        // 3.创建内容collocationView
        setupContentView()
        
    }

    override func viewWillAppear(animated: Bool) {
        // 隐藏导航栏，创建自定义导航栏
        self.navigationController?.navigationBarHidden = true
    }
    
    func setupHeaderView(){
    
        // 0.创建容器视图
        headerView = UIView()
        headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 280)
        //headerView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(headerView)
        // 1.创建轮播图
        setupBannerView()
        // 2.创建标题button
        setupTitleButtons()
        // 3.创建标题滑动collectionView
        setupTitleScrollView()
        
    }
    // 创建内容视图
    func setupContentView(){
    
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .Horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        
        contentView = UICollectionView(frame: CGRectMake(0, CGRectGetMaxY(titleScrollView.frame), SCREEN_WIDTH, SCREEN_HEIGHT), collectionViewLayout: layout)
        contentView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIDentifier")
        contentView.contentSize = CGSizeMake(13*SCREEN_WIDTH, 0)
        contentView.bounces = false
        contentView.pagingEnabled = true
        contentView.backgroundColor = UIColor.whiteColor()
        contentView.delegate = self
        contentView.dataSource = self
        self.view.addSubview(contentView!)

        
    }
    func setupTitleScrollView(){
    
        titleArr = ["最新","文艺","礼物","指南","爱美","设计","吃货","厨房","上班","学生","聚会","节日","宿舍"]
        titleScrollView = TitleView(titleArr: titleArr, normalColor: SubTitleColor, highlightColor: UIColor.redColor(), fontSize: 16.0)
        titleScrollView.frame = CGRectMake(0, CGRectGetMaxY(bannerView.frame)+100, SCREEN_WIDTH, 36)
        headerView.addSubview(titleScrollView)
    }
    //MARK: - titleView delegate
    func TitleViewClick(titleVIew: TitleView, clickBtnIndex: Int) {
        // 点击标题按钮，联动底部collocationView
        weak var weakSelf = self
        UIView.animateWithDuration(0.3) { 
            weakSelf?.contentView.contentOffset = CGPointMake(CGFloat(clickBtnIndex)*SCREEN_WIDTH, 0)
        }
    }
    
    func setupTitleButtons(){
    
        let index  = 4
        let images = ["GoodSomething","PlantingGrass","searchLarge","SignIn"]
        let margin:CGFloat = 35
        let btnW:CGFloat = 50
        let btnH:CGFloat = 70
        
        for i in 0..<index {

            let col = i % index // 列号
            //let row = i / index // 行号
            // 添加btn
            let btn = UIButton()
            btn.tag = i + 1
            btn.x = CGFloat(col) * (btnW + margin) + margin
            btn.y = CGRectGetMaxY(bannerView.frame) + 20
            
            btn.size = CGSizeMake(btnW, btnH)
            btn.setImage(UIImage(named: images[i]), forState: .Normal)
            btn.adjustsImageWhenHighlighted = false
            btn.addTarget(self, action: #selector(HomeViewController.btnClick(_:)), forControlEvents: .TouchUpInside)

            headerView.addSubview(btn)
            
        }

    }
    // 标题按钮点击方法
    func btnClick(btn:UIButton){
     
        switch btn.tag {
        case 1:
            print("好物")
        case 2:
            print("种草")
        case 3:
            print("搜索")
        case 4:
            print("签到")
        default:
            break
        }
    }
    // 设置头部轮播图片
    func setupBannerView(){
    
        let imgs = ["http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150717/ersqeu575.jpg-w720","http://7fvaoh.com3.z0.glb.qiniucdn.com/image/150729/ipds0i95t.jpg-w720"]
        bannerView = DCPicScrollView(frame: CGRectMake(0, -20, SCREEN_WIDTH, 170), withImageUrls: imgs)
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
    
    // MARK:- collectionView delegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return titleArr.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
