//
//  ShootTableViewCell.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import SnapKit

class ShootTableViewCell: UITableViewCell {

    
    lazy var showImg        = UIImageView()
    lazy var showTitle      = UILabel()
    lazy var showLine       = UIView()
    lazy var showTitleBG    = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        setupUI()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension ShootTableViewCell {
    
    fileprivate func setupUI(){
    
        let heightBounds :CGFloat   = 200
        
        self.addSubview(showImg)
        showImg.contentMode = UIViewContentMode.scaleAspectFill
        showImg.clipsToBounds = true
        showImg.snp.makeConstraints { (make) in
            make.size.equalTo(self)
            make.center.equalTo(self)
        }
        
        self.addSubview(showTitleBG)
        showTitleBG.backgroundColor = UIColor.black
        showTitleBG.alpha           = 0.4
        showTitleBG.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(heightBounds/3*2)
            make.width.equalTo(kScreenW/3*2)
            make.height.equalTo(40)
        }
        
        self.addSubview(showTitle)
        showTitle.textAlignment     = NSTextAlignment.center
        showTitle.backgroundColor   = UIColor.clear
        showTitle.textColor         = UIColor.white
        showTitle.font              = UIFont.systemFont(ofSize: 14)
        showTitle.snp.makeConstraints { (make) in
            make.edges.equalTo(showTitleBG)
        }
        
        self.addSubview(showLine)
        showLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(heightBounds - 1)
            make.size.equalTo(CGSize.init(width: kScreenW, height: 0.8))
        }
        
        showLine.backgroundColor    = UIColor.orange
        
    }

}
