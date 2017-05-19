//
//  ShootMainCollectionReusableView.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit

class ShootMainCollectionReusableView: UICollectionReusableView {
    
    lazy var btnNext        = UIButton()
    lazy var ivTitle        = UIImageView()
    lazy var labTitle       = UILabel()
    lazy var labSubTitle    = UILabel()
    lazy var lineL          = UIView()
    lazy var lineR          = UIView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSizeByString(title:String,subTitle:String){
        
    }
}

//set get  写自适应

extension ShootMainCollectionReusableView {

    fileprivate func setupUI(){
        
        self.addSubview(labTitle)
        labTitle.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(10)
            make.centerY.equalTo(self.snp.centerY).offset(-10)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        labTitle.text = "当季优选"
        labTitle.textColor = kColorMainTitle
        labTitle.font = UIFont.systemFont(ofSize: 16)
        labTitle.textAlignment = .center
        
        self.addSubview(ivTitle)
        ivTitle.snp.makeConstraints { (make) in
            make.right.equalTo(labTitle.snp.left)
            make.centerY.equalTo(labTitle.snp.centerY)
            make.size.equalTo(CGSize.init(width: 16, height: 16))
        }
        ivTitle.contentMode = .scaleAspectFit
        
        
        self.addSubview(labSubTitle)
        labSubTitle.snp.makeConstraints { (make) in
            make.top.equalTo(labTitle.snp.bottom).offset(5)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(16)
        }
        labSubTitle.text = "精选最新航拍照片"
        labSubTitle.textColor = kColorMainSubTitle
        labSubTitle.font = UIFont.systemFont(ofSize: 11)
        labSubTitle.textAlignment = .center
        

        self.addSubview(lineL)
        lineL.snp.makeConstraints { (make) in
            make.centerY.equalTo(labSubTitle.snp.centerY).offset(-1)
            make.height.equalTo(0.6)
            make.right.equalTo(labSubTitle.snp.left).offset(-5)
            make.width.equalTo(20)
        }
        lineL.backgroundColor = kColorMainSubTitle
        
        self.addSubview(lineR)
        lineR.snp.makeConstraints { (make) in
            make.centerY.equalTo(lineL.snp.centerY)
            make.height.equalTo(lineL.snp.height)
            make.left.equalTo(labSubTitle.snp.right).offset(5)
            make.width.equalTo(lineL.snp.width)
        }
        lineR.backgroundColor = kColorMainSubTitle

        let img = UIImage(named:"ShootNext")
        self.addSubview(btnNext)
        btnNext.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(-20)
            make.size.equalTo((img?.size)!)
        }
        btnNext.setImage(img, for: .normal)
    }
    
    public func calculateWidthByString(text:String,font:UIFont,maxSize:CGSize) -> CGRect {

        let attributes = [NSFontAttributeName:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: maxSize, options: option, attributes: attributes, context: nil)
        
        return rect
    }
}
