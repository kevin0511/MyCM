//
//  MeMainViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MeMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的主页"
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension MeMainViewController {

    fileprivate func setupUI(){
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 10, y: 74, width: 80, height: 30)
        btn.backgroundColor = UIColor.lightGray
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func btnAction(sender:UIButton) {
        self.navigationController?.pushViewController(CalendarManagerViewController(), animated: true)
    }
}
