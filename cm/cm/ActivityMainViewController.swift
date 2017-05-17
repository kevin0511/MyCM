//
//  ActivityMainViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit


class ActivityMainViewController: UIViewController {

    fileprivate let vm = ActivityMainViewModel()
    fileprivate var childVcs = [UIViewController]()

    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                                width: kScreenW, height: kMainTitleViewH)
        let titles = ["采摘园","享美食","品小吃","酒店名宿","乐骑行"]
        let titleView = PageTitleView(frame: titleFrame,
                                      titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView: PageContentView = {[weak self] in
        
        let contentViewY :CGFloat = kStateBarH + kNavgationBarH + kMainTitleViewH
        let contentViewFrame = CGRect(x: 0, y: contentViewY, width: kScreenW,
                                      height: kScreenH - contentViewY - kTabBarH)
        
        var childVcs    = [UIViewController]()
        
        let pickVC      = PickViewController()
        let foodsVC     = FoodsViewController()
        let snackVC     = SnacksViewController()
        let hotelVC     = HotelViewController()
        let cyclingVC   = CyclingViewController()
        
        childVcs.append(pickVC)
        childVcs.append(foodsVC)
        childVcs.append(snackVC)
        childVcs.append(hotelVC)
        childVcs.append(cyclingVC)
        
        self?.childVcs = childVcs

        for vc in childVcs {
            
            self?.addChildViewController(vc)
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
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
        //内边距调整
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)

    }

}
extension ActivityMainViewController :PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        
        pageContentView.setCurrentIndex(currentIndex: index)

    }
}

extension ActivityMainViewController :PageContentViewDelegate{
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
        pageTitleView.setCurrentTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}


