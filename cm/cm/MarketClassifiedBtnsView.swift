//
//  MarketClassifiedView.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit
import ReactiveSwift

class MarketClassifiedBtnsView: UIView {

    //w/2 * 70
    
    lazy var leftBtn:MarkeBtn_Longitudinal  = MarkeBtn_Longitudinal()
    lazy var topBtn:MarkeBtn_Horizontal     = MarkeBtn_Horizontal()
    lazy var bottomBtn:MarkeBtn_Horizontal  = MarkeBtn_Horizontal()
    lazy var lineLongitudinal   :UIView     = UIView()
    lazy var lineHorizontal     :UIView     = UIView()
    lazy var lineBottom         :UIView     = UIView()

     override init(frame: CGRect){
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension MarketClassifiedBtnsView {

    fileprivate func setupUI(){
        
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(kScreenW/2)
            make.bottom.equalTo(0)
        }
        leftBtn.title.text = "当季优选"
        leftBtn.subTitle.text = "选自崇明当季优质食品"
        leftBtn.imgView.image = UIImage(named:"market_left")
        leftBtn.backgroundColor = UIColor(r:203,g:244,b:245)
        
        self.addSubview(topBtn)
        topBtn.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right)
            make.top.equalTo(0)
            make.width.equalTo(kScreenW/2)
            make.height.equalTo(self.bounds.size.height/2)
        }
        topBtn.title.text = "崇明特产"
        topBtn.subTitle.text = "崇明特色介绍"
        topBtn.imgView.image = UIImage(named:"market_top")
        topBtn.backgroundColor = UIColor(r:230,g:222,b:249)

        self.addSubview(bottomBtn)
        bottomBtn.snp.makeConstraints { (make) in
            make.left.equalTo(topBtn.snp.left)
            make.top.equalTo(topBtn.snp.bottom)
            make.width.equalTo(topBtn.snp.width)
            make.height.equalTo(topBtn.snp.height)
        }
        bottomBtn.title.text = "生鲜"
        bottomBtn.subTitle.text = "生鲜优选介绍"
        bottomBtn.imgView.image = UIImage(named:"market_bottom")
        bottomBtn.backgroundColor = UIColor(r:248,g:247,b:225)

        /*
        self.addSubview(lineHorizontal)
        lineHorizontal.backgroundColor = UIColor.white
        lineHorizontal.snp.makeConstraints { (make) in
            make.left.equalTo(topBtn.snp.left)
            make.top.equalTo(topBtn.snp.bottom)
            make.width.equalTo(topBtn.snp.width)
            make.height.equalTo(0.6)
        }
        
        self.addSubview(lineLongitudinal)
        lineLongitudinal.backgroundColor = UIColor.white
        lineLongitudinal.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right)
            make.top.equalTo(0)
            make.height.equalTo(self.bounds.size.height)
            make.width.equalTo(0.6)
        }
        
        self.addSubview(lineBottom)
        lineBottom.backgroundColor = UIColor.white
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(0.6)
            make.width.equalTo(kScreenW)
        }
        */
        leftBtn.addTarget(self, action: #selector(leftBtnAction(sender:)), for: .touchUpInside)
        topBtn.addTarget(self, action: #selector(topBtnAction(sender:)), for: .touchUpInside)
        bottomBtn.addTarget(self, action: #selector(bottomBtnAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func leftBtnAction(sender:UIButton) {
        print("left Btn")
    }
    
    @objc private func topBtnAction(sender:UIButton) {
        print("top Btn")

    }
    @objc private func bottomBtnAction(sender:UIButton) {
        print("bottom Btn")

    }
}
