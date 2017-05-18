//
//  ShootModel.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootModel: NSObject {

    var arrImgs     = [UIImage]()
    var arrTitles   = [NSString]()
    
    override init() {
       
        super.init()
        
        getData()
    }
}



extension ShootModel {

    fileprivate func getData(){
        
        let arrTemp = NSMutableArray()
        
        for i in 1...10 {
        
            let imgName = "shoot\(i).jpeg"
            let img :UIImage = UIImage(named:imgName)!
            arrTemp.add(img)
        }
        
        arrImgs = arrTemp.copy() as! [UIImage]
        
        arrTitles.append("龚胜平-绿华鱼塘-摄于绿华镇")
        arrTitles.append("龚胜平-收获的季节-摄于东平镇")
        arrTitles.append("黎军-绿色运动-摄于陈家镇")
        arrTitles.append("黎军-乡村之晨-摄于城桥镇")
        arrTitles.append("陆一-摄于航拍")
        arrTitles.append("陆一-摄于大桥")
        arrTitles.append("陆一-船厂的早晨-摄于城桥镇")
        arrTitles.append("陆一-秋收-摄于东平镇")
        arrTitles.append("陆一-湿地春色-摄于东滩湿地")
        arrTitles.append("童宝兴-美景如画-摄于大东船厂")
    }
}
