//
//  ShootListModel.swift
//  cm
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

enum ShootListCellType :Int {
    case Spring = 0
    case Summer
    case Autumn
    case winer
}

class ShootListModel: NSObject {

    var shotListCellType = ShootListCellType.Spring
    
    override init() {

    }
    
    
}
