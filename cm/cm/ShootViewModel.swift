//
//  ShootViewModel.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootViewModel: NSObject {

    var model = ShootModel()
}

extension ShootViewModel :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        
        var str : NSString
        
        switch model.cellType {
        case .AerialImage:
            str = "AerialImage"
        case .Township:
            str = "Township"
        case .Spring:
            str = "Spring"
        case .Summer:
            str = "summer"
        case .Autumn:
            str = "autumn"
        case .Winter:
            str = "winter"
        }
        
        cell.textLabel?.text =  "\(str)\(indexPath.row)"
        return cell
    }
}
