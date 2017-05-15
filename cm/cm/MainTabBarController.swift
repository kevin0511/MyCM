//
//  MainTabBarController.swift
//  CM
//
//  Created by Kevin on 2017/5/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainTabBarController{

    fileprivate func setup(){
    
        self.tabBar.isTranslucent = false   //避免受默认的半透明色影响，关闭
        self.tabBar.tintColor = kColorMainGreen
        
        
        let activityVC          = ActivityMainViewController()
        let exportVC            = ExportMainViewController()
        let meVC                = MeMainViewController()
        
        let arrVcs              = [activityVC,exportVC,meVC]
        let arrTitles           = ["郊游","出口","我"]
        let arrImgs             = [UIImage(named:"tabbarActivity"),
                                   UIImage(named:"tabbarExport"),
                                   UIImage(named:"tabbarMe")]
        let arrImgsHighLight    = [UIImage(named:"tabbarActivityHL"),
                                   UIImage(named:"tabbarExportHL"),
                                   UIImage(named:"tabbarMeHL")]
        
        for (index,viewController) in arrVcs.enumerated() {
        
            let vc      = viewController
            let title   = arrTitles[index]
            let img     = arrImgs[index]
            let imgHL   = arrImgsHighLight[index]?.withRenderingMode(.alwaysOriginal)

            self.addChildViewController( vc     :vc,
                                         title  :title,
                                         img    :img!,
                                         imgHL  :imgHL!)
        }
    }
    
    private func addChildViewController( vc      :UIViewController,
                                         title   :String,
                                         img     :UIImage,
                                         imgHL   :UIImage){
        
        vc.tabBarItem.title         = title
        vc.tabBarItem.image         = img
        vc.tabBarItem.selectedImage = imgHL
        vc.view.backgroundColor     = UIColor.white
        
        self.addChildViewController(setNavControllerWithRootVC(rootVC: vc))
    }
    
    private func setNavControllerWithRootVC(rootVC:UIViewController) -> UINavigationController{
        
        let navC = UINavigationController.init(rootViewController: rootVC)
        navC.navigationBar.barTintColor         = kColorMainGreen
        navC.navigationBar.tintColor            = UIColor.yellow
        navC.navigationBar.titleTextAttributes  = [NSForegroundColorAttributeName:UIColor.white]
        navC.popToRootViewController(animated: true)
        
        return navC;
    }
}
