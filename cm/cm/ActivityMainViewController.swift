//
//  ActivityMainViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 60

class ActivityMainViewController: UIViewController {

    //懒加载 属性     {}()是闭包的形式创建
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                                width: kScreenW, height: kTitleViewH)
        let titles = ["景点","采摘","美食","小吃","骑行","酒店名宿"]
        let titleView = PageTitleView(frame: titleFrame,
                                      titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView: PageContentView = {[weak self] in
        
        let contentViewY :CGFloat = kStateBarH + kNavgationBarH + kTitleViewH
        let contentViewFrame = CGRect(x: 0, y: contentViewY, width: kScreenW,
                                      height: kScreenH - contentViewY - kTabBarH)
        
        var childVcs = [UIViewController]()
        
        //childVcs.append(RecommandViewController())
        
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentViewFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "晓崇明"
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


// MARK:- 设置UI界面
extension ActivityMainViewController{
    
    fileprivate func  setupUI(){
        //0- 内边距调整
        automaticallyAdjustsScrollViewInsets = false
        //1- 设置导航栏
        setupNavigationBar()
        //2- 添加titleView
        view.addSubview(pageTitleView)
        //3- 添加contentView
        view.addSubview(pageContentView)
    }
    
    private func setupNavigationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "logo")
        
        //扩展后  使用便利构造函数
        let sizeBtn =   CGSize(width:40,height:40);
        let historyItem =  UIBarButtonItem(imgName: "Image_my_history_click", size: sizeBtn)
        let searchItem  = UIBarButtonItem(imgName: "btn_search", HLimgName: "btn_search_clicked", size: sizeBtn)
        let qrcodeItem  = UIBarButtonItem(imgName: "home_newSaoicon",  size: sizeBtn)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}

extension ActivityMainViewController :PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension ActivityMainViewController :PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        pageTitleView.setCurrentTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
