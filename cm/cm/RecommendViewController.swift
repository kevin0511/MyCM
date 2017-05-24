//
//  SnacksViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit

class RecommendViewController: UIViewController {

    
    lazy var labShow = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RecommendViewController {

    fileprivate func setupUI() {
    
        view.backgroundColor = UIColor.white
        
        view.addSubview(labShow)
        labShow.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
            
        }
        labShow.numberOfLines = 0
        labShow.font = UIFont.systemFont(ofSize: 16)
        labShow.text = "享崇明美食，乐瀛岛骑行，品采摘趣味，领农家风采\n\n照片:多张\n\n名字:顾伯伯农家乐\n\n坐标:虹桥村XXX号 距离大桥下来50公里 距离森林公园1公里 根宝足球基地2公里 紫海鹭缘3公里 三民文化村 4公里\n\n简介:顾伯伯农家乐是以村为单位的农家联盟，有28家农家乐组成，提供全套一体的农家乐风情体验\n\n特别团介绍:1-老年团特别预约\n\n标签:\n1.餐饮-2.住宿-3.KTV-4.采摘-5.骑行-6.烧烤-7.钓鱼-8.商业会议\n\napp包含功能:\n1.房间预览-2.房间预订-3.订餐-4.骑行预约-5.预约用车(板块刚刚开启 目前只有3辆车，需要提早预约)4-投诉举报"
        
    }

}
