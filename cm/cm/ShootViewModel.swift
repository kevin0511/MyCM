//
//  ShootViewModel.swift
//  CM
//
//  Created by Kevin on 2017/5/16.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ShootViewModel: NSObject {

}



extension ShootViewModel :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.textLabel?.text =  "\(indexPath.row)"
        return cell
    }
}
