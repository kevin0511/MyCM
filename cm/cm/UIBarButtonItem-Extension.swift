//
//  UIBarButtonItem-extension.swift
//  DouYu
//
//  Created by kevin.zhang on 2017/3/15.
//  Copyright © 2017年 kevin.zhang. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    //class 表示类方法
    /*
    class func createItem(imgName:String,
                          HLimgName:String,
                          size:CGSize) -> UIBarButtonItem
    {
        let btn = UIButton()
        btn.setImage(UIImage(named:imgName), for: .normal)
        btn.setImage(UIImage(named:HLimgName), for: .highlighted)
        btn.frame = CGRect(origin:CGPoint(x:0,y:0),size:size)
        return UIBarButtonItem(customView:btn)
    }
 */
    /*
     括号内创建的是 构造函数  swift 推荐构造函数
     let btn = UIButton(type: UIButtonType)
     */
    
    //便利构造函数:
    /*
        1- convenience 开头
        2- 在构造函数中明确调用一个设计的构造函数 并且使用self调用
            比如: self.init(customView:btn)
     
        外界调用的时候 已经赋值的 调用的时候可以无视
        1-UIBarButtonItem(imgName: "logo")
        2-UIBarButtonItem(imgName: "Image_my_history_click", size: sizeBtn)
        3-UIBarButtonItem(imgName: "btn_search", HLimgName: "btn_search_clicked", size: sizeBtn)
     
     */
    convenience init(imgName:String, HLimgName:String="", size:CGSize=CGSize.zero) {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named:imgName), for: .normal)
        
        if HLimgName != "" {
            btn.setImage(UIImage(named:HLimgName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }
        else {
            btn.frame = CGRect(origin:CGPoint.zero,size:size)
        }
        
        self.init(customView:btn)
    }
}
