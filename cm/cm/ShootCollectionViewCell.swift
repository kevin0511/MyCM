//
//  ShootCollectionViewCell.swift
//  cm
//
//  Created by Kevin on 2017/5/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit

class ShootCollectionViewCell: UICollectionViewCell {
    
    lazy var ivImg              = UIImageView()
    lazy var labImgName         = UILabel()
    lazy var labAuthorName      = UILabel()
    //lazy var ivLocation         = UIImageView()
    //lazy var labLocation        = UILabel()
    lazy var ivTag              = UIImageView()
    
    convenience   required   init(coder : NSCoder){
        self.init(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
    }
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
}


extension ShootCollectionViewCell {
    
    fileprivate func setupUI(){
        
        let boundsWidth = self.bounds.size.width
        
        self.addSubview(ivImg)
        ivImg.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(boundsWidth/3*2)
        }
        ivImg.contentMode = .scaleAspectFill
        ivImg.clipsToBounds = true

        
        ivImg.addSubview(labImgName)
        labImgName.snp.makeConstraints { (make) in
            make.top.equalTo(ivImg.snp.bottom).offset(-20)
            make.left.equalTo(5)
            make.width.equalTo(boundsWidth/2)
            make.height.equalTo(20)
        }
        labImgName.text = "乡村之晨"
        labImgName.textColor = UIColor.white
        labImgName.font = UIFont.boldSystemFont(ofSize: 14)
        labImgName.adjustsFontSizeToFitWidth = true

//        ivImg.addSubview(labLocation)
//        labLocation.snp.makeConstraints { (make) in
//            make.top.equalTo(ivImg.snp.bottom).offset(-16)
//            make.right.equalTo(-5)
//            make.width.equalTo(32)
//            make.height.equalTo(16)
//        }
//        labLocation.text = "森林公园"
//        labLocation.textColor = UIColor.white
//        labLocation.font = UIFont.systemFont(ofSize: 11)
//        //labLocation.adjustsFontSizeToFitWidth = true
//        labLocation.textAlignment = .right
//        labLocation.backgroundColor = UIColor.red
        
        self.addSubview(labAuthorName)
        labAuthorName.snp.makeConstraints { (make) in
            make.top.equalTo(ivImg.snp.bottom).offset(2)
            make.left.equalTo(0)
            make.width.equalTo(boundsWidth)
            make.height.equalTo(20)
        }
        labAuthorName.text = "作者: 黎军"
        labAuthorName.textColor = kColorMainSubTitle
        labAuthorName.font = UIFont.systemFont(ofSize: 12)
    }
}
