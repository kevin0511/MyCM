//
//  ShootViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootViewController: UIViewController {

    let vm = ShootViewModel()
    
    fileprivate lazy var tableView: UITableView = {[weak self] in
        
        let heightNeedMinus :CGFloat = kStateBarH + kNavgationBarH + kMainTitleViewH + kTabBarH
        let frame = CGRect.init(origin: CGPoint.zero,
                                size: CGSize.init(width: kScreenH, height: kScreenH - heightNeedMinus))
        let tv = UITableView.init(frame:frame)

        tv.delegate         = self?.vm
        tv.dataSource       = self?.vm
        tv.separatorStyle   = UITableViewCellSeparatorStyle.none
        return tv
        
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ShootViewController {

    fileprivate func setupUI(){
        view.addSubview(tableView)
    }
}
