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
        return self.model.arrImgs.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        let cell = ShootTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.showTitle.text =  self.model.arrTitles[indexPath.row] as String
        cell.showImg.image = self.model.arrImgs[indexPath.row]

        return cell
    }
}
