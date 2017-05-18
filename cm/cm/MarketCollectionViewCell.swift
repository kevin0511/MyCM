//
//  MarketCollectionViewCell.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit

class MarketCollectionViewCell: UICollectionViewCell {
    
    lazy var imgView        = UIImageView()
    lazy var title          = UILabel()
    lazy var subTitle       = UILabel()
    lazy var price          = UILabel()
    lazy var shoppingCart   = UIButton()
    lazy var ivTag          = UIImageView()
    
    convenience   required   init(coder : NSCoder){
        self.init(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
    }
  
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
}


extension MarketCollectionViewCell {

    fileprivate func setupUI(){
    
        let boundsWidth = self.bounds.size.width
        
        self.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(boundsWidth)
        }
        imgView.backgroundColor = UIColor.lightGray
        imgView.contentMode = .scaleAspectFit
        
        imgView.addSubview(ivTag)
        ivTag.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.left.equalTo(0)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        ivTag.backgroundColor = UIColor.red
        
        
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(-5)
            make.height.equalTo(20)
        }
        title.text = "当季优选"
        title.textColor = kColorMainTitle
        title.font = UIFont.systemFont(ofSize: 16)
        
        self.addSubview(subTitle)
        subTitle.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(4)
            make.left.equalTo(title.snp.left)
            make.right.equalTo(title.snp.right)
            make.height.equalTo(title.snp.height)
        }
        subTitle.text = "当季优选详情说明"
        subTitle.textColor = kColorMainSubTitle
        subTitle.font = UIFont.systemFont(ofSize: 13)
        
        
        self.addSubview(shoppingCart)
        shoppingCart.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.right.equalTo(-10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        shoppingCart.setImage(UIImage(named:"market_shopCart"), for: .normal)
        
        
        self.addSubview(price)
        price.snp.makeConstraints { (make) in
            make.top.equalTo(shoppingCart.snp.top)
            make.left.equalTo(title.snp.left)
            make.right.equalTo(shoppingCart.snp.left).offset(-10)
            make.height.equalTo(shoppingCart.snp.height)
        }
        price.text = "￥ 88.00"
        price.textColor = UIColor.red
        price.font = UIFont.systemFont(ofSize: 18)
        
    }

}
