//
//  MarkeBtn_Longitudinal.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit
//纵向排版
class MarkeBtn_Longitudinal: UIButton {

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
extension MarkeBtn_Longitudinal {
    
    fileprivate func setupUI(){
        
        
        self.addSubview(imgView)
        imgView.layer.cornerRadius = widthImg/2
        imgView.clipsToBounds = true
        imgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.centerY).offset(-5)
            make.size.equalTo(CGSize.init(width: widthImg, height: widthImg))
        }
        
        self.addSubview(title)
        title.textColor = kColorMainTitle
        title.font = UIFont.systemFont(ofSize: 16)
        title.textAlignment = .center
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).offset(10)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(20)
        }
        
        self.addSubview(subTitle)
        subTitle.textColor = kColorMainSubTitle
        subTitle.font = UIFont.systemFont(ofSize: 14)
        subTitle.textAlignment = .center
        subTitle.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(20)
        }
        
        
        title.text = "优选水果"
        subTitle.text = "严选优质进口水果"
        imgView.backgroundColor = UIColor.lightGray
    }
}
