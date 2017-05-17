//
//  ShootModel.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

enum ShootCellType :Int {
    case    AerialImage,Township,Spring,
            Summer, Autumn, Winter
}

class ShootModel: NSObject {

    var cellType = ShootCellType.AerialImage
    
    override init() {
        
    }
    
}
