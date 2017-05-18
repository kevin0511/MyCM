//
//  ShootViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootViewController: UIViewController {

    var vm          = ShootViewModel()
    var model       = ShootModel()
    let selfBounds  = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: kScreenW, height:kScreenH - (kStateBarH + kNavgationBarH + kMainTitleViewH + kTabBarH)))
    
    fileprivate lazy var tableView: UITableView = {[weak self] in
        
        let tv = UITableView.init(frame:(self?.selfBounds)!)
        tv.delegate         = self?.vm
        tv.dataSource       = self?.vm
        tv.separatorStyle   = UITableViewCellSeparatorStyle.none
        tv.bounces          = false
        return tv
        
        }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.vm.model = self.model
        
        setupUI()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ShootViewController {

    fileprivate func setupUI(){
        
        self.view.bounds = self.selfBounds
        view.addSubview(tableView)

        
    }

}
