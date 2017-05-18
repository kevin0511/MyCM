//
//  MarketClassifiedItemBtn.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit
//横向排版
class MarkeBtn_Horizontal: UIButton {

    lazy var title          = UILabel()
    lazy var subTitle       = UILabel()
    lazy var imgView        = UIImageView()
    let widthImg :CGFloat   = 40
    // w/2 * 70   40*40  10
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension MarkeBtn_Horizontal {

    fileprivate func setupUI(){
    
        self.addSubview(title)
        title.textColor = kColorMainTitle
        title.font = UIFont.systemFont(ofSize: 16)
        title.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.bottom.equalTo(self.snp.centerY)
            make.right.equalTo(-20-widthImg)
            make.height.equalTo(20)
        }
        
        self.addSubview(subTitle)
        subTitle.textColor = kColorMainSubTitle
        subTitle.font = UIFont.systemFont(ofSize: 14)
        subTitle.snp.makeConstraints { (make) in
            make.left.equalTo(title.snp.left)
            make.top.equalTo(title.snp.bottom)
            make.right.equalTo(title.snp.right)
            make.height.equalTo(title.snp.height)
        }
        
        self.addSubview(imgView)
        imgView.layer.cornerRadius = widthImg/2
        imgView.clipsToBounds = true
        imgView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(-10)
            make.size.equalTo(CGSize.init(width: widthImg, height: widthImg))
        }
        
        title.text = "优选水果"
        subTitle.text = "严选优质进口水果"
        imgView.backgroundColor = UIColor.lightGray
    }
}
