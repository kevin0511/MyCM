//
//  ShootMainViewController.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootMainViewController: UIViewController {
    
    let vm      = ShootViewModel()
    let model   = ShootModel()
    
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                                width: kScreenW, height: kMainTitleViewH)
        let titles = ["航拍","乡镇","春","夏","秋","冬"]
        let titleView = PageTitleView(frame: titleFrame,
                                      titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var tableView: UITableView = {[weak self] in
        
        let heightNeedMinus :CGFloat = kStateBarH + kNavgationBarH + kMainTitleViewH + kTabBarH
        let frame = CGRect.init(origin: CGPoint.init(x: 0, y: (self?.pageTitleView.frame.size.height)! + kStateBarH + kNavgationBarH),size: CGSize.init(width: kScreenH, height: kScreenH - heightNeedMinus))
        let tv = UITableView.init(frame:frame)
        
        tv.delegate         = self?.vm
        tv.dataSource       = self?.vm
        tv.separatorStyle   = UITableViewCellSeparatorStyle.none
        return tv
        
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.model = model
        setupUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ShootMainViewController {
    
    fileprivate func setupUI(){
        
        automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "崇明摄协"
        view.addSubview(pageTitleView)
        view.addSubview(tableView)
    }
}

extension ShootMainViewController :PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        
        self.model.cellType = ShootCellType(rawValue: index)!
        tableView.reloadData()

    }
}
