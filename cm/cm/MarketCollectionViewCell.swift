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
    lazy var subTitleKG     = UILabel()
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
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true

        imgView.addSubview(ivTag)
        ivTag.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(-30)
            make.left.equalTo(0)
            make.width.equalTo(55)
            make.height.equalTo(15)
        }
        ivTag.contentMode = .scaleAspectFill
        ivTag.clipsToBounds = true
        
        
        self.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(-5)
            make.height.equalTo(16)
        }
        title.text = "当季优选"
        title.textColor = kColorMainTitle
        title.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(subTitle)
        subTitle.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(5)
            make.left.equalTo(title.snp.left)
            make.right.equalTo(title.snp.right)
            make.height.equalTo(title.snp.height)
        }
        subTitle.text = "当季优选详情说明"
        subTitle.textColor = kColorMainSubTitle
        subTitle.font = UIFont.systemFont(ofSize: 11)
        
        self.addSubview(subTitleKG)
        subTitleKG.snp.makeConstraints { (make) in
            make.top.equalTo(subTitle.snp.bottom)
            make.left.equalTo(title.snp.left)
            make.right.equalTo(title.snp.right)
            make.height.equalTo(title.snp.height)
        }
        subTitleKG.text = "500克"
        subTitleKG.textColor = kColorMainSubTitle
        subTitleKG.font = UIFont.systemFont(ofSize: 11)
        
        
        self.addSubview(shoppingCart)
        shoppingCart.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
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
