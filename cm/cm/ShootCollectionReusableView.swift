//
//  ShootCollectionReusableView.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootCollectionReusableView: UICollectionReusableView {
    
    lazy var ivNext     = UIImageView()
    lazy var labWord    = UILabel()
    lazy var labTitle   = UILabel()
    lazy var btn        = UIButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ShootCollectionReusableView {
    
    fileprivate func setupUI(){
        
        let ivWidth:CGFloat = 20
        
        self.addSubview(ivNext)
        ivNext.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(-5)
            make.size.equalTo(CGSize.init(width: ivWidth, height: ivWidth))
        }
        self.ivNext.image = UIImage(named:"market_right")
        self.ivNext.contentMode = .scaleAspectFit
        
        
        self.addSubview(btn)
        btn.setTitle("查看全部", for: UIControlState.normal);
        btn.setTitleColor(kColorMainSubTitle, for:.normal);
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        btn.titleLabel!.textAlignment = .right
        btn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(ivNext.snp.left)
            make.size.equalTo(CGSize.init(width: 60, height: ivWidth))
        }
        
        self.addSubview(labWord)
        labWord.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(5)
            make.size.equalTo(CGSize.init(width: ivWidth, height: ivWidth))
        }
        labWord.text = "春"
        labWord.textColor = kColorMainTitle
        labWord.font = UIFont.systemFont(ofSize: 20)
        
        self.addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            
            make.left.equalTo(labWord.snp.right).offset(5)
            make.right.equalTo(btn.snp.left).offset(-10)
            make.bottom.equalTo(labWord.snp.bottom).offset(3)
            make.height.equalTo(16)
        }
        labTitle.text = "两个黄鹂鸣翠柳，一行白鹭上青天"
        labTitle.textColor = kColorMainSubTitle
        labTitle.font = UIFont.systemFont(ofSize: 10)
        
        
    }
    
}
