//
//  MarketCollectionReusableView.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MarketCollectionReusableView: UICollectionReusableView {
 
    lazy var imgViewL   = UIImageView()
    lazy var imgViewR   = UIImageView()
    lazy var title      = UILabel()
    lazy var btn        = UIButton()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MarketCollectionReusableView {
    
    fileprivate func setupUI(){
        
        let ivWidth:CGFloat = 20
        
        self.addSubview(imgViewL)
        imgViewL.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(5)
            make.size.equalTo(CGSize.init(width: ivWidth, height: ivWidth))
        }
        self.imgViewL.image = UIImage(named:"market_star")
        self.imgViewL.contentMode = .scaleAspectFit
        
        self.addSubview(imgViewR)
        imgViewR.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(-5)
            make.size.equalTo(CGSize.init(width: ivWidth, height: ivWidth))
        }
        self.imgViewR.image = UIImage(named:"market_right")
        self.imgViewR.contentMode = .scaleAspectFit
        
        self.addSubview(title)
        title.text = "当季优选"
        title.textColor = kColorMainTitle
        title.font = UIFont.systemFont(ofSize: 14)
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(imgViewL.snp.right).offset(5)
            make.size.equalTo(CGSize.init(width: 100, height: ivWidth))
        }
        
        
        self.addSubview(btn)
        btn.setTitle("查看全部", for: UIControlState.normal);
        btn.setTitleColor(kColorMainSubTitle, for:.normal);
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        btn.titleLabel!.textAlignment = .right
        btn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(imgViewR.snp.left)
            make.size.equalTo(CGSize.init(width: 60, height: ivWidth))
        }
        
        
        btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        
    }
    
    func btnAction(sender:UIButton) {
        print("查看全部")
    }
    
}
