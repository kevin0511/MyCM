//
//  ShootMainCollectionViewCell.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootMainCollectionViewCell: UICollectionViewCell {
    
    lazy var ivImg              = UIImageView()
    lazy var labImg             = UILabel()
    lazy var labAuthor          = UILabel()

    convenience   required   init(coder : NSCoder){
        self.init(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
    }
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
}

extension ShootMainCollectionViewCell {

    
    fileprivate func setupUI(){
    
        self.addSubview(ivImg)
        ivImg.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self.bounds.size.width/5*3)
        }
        ivImg.contentMode = .scaleAspectFill
        ivImg.clipsToBounds = true
        
        ivImg.addSubview(labImg)
        labImg.snp.makeConstraints { (make) in
            make.bottom.equalTo(-5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(16)
        }
        labImg.text = "照片名字"
        labImg.textColor = UIColor.white
        labImg.font = UIFont.boldSystemFont(ofSize: 14)
        
        self.addSubview(labAuthor)
        labAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(ivImg.snp.bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(-5)
            make.height.equalTo(16)
        }
        labAuthor.text = "作者名字"
        labAuthor.textColor = kColorMainSubTitle
        labAuthor.font = UIFont.boldSystemFont(ofSize: 10)

    }

}
