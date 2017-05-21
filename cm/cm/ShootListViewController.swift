//
//  ShootListViewController.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

private let kItemW                  = (kScreenW - 3 * kItemMargin)/2
private let kItemH                  = kItemW * 0.8 + 10
private let kItemMargin  : CGFloat  = 10
private let kHeaderViewH : CGFloat  = 60
private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kCellTag      = 1000

class ShootListViewController: UIViewController {

    var model = ShootListModel()
    
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                                width: kScreenW, height: kMainTitleViewH)
        let titles = ["春","夏","秋","冬"]
        let titleView = PageTitleView(frame: titleFrame,
                                      titles: titles)
        titleView.delegate = self
        titleView.backgroundColor = UIColor.white
        return titleView
        }()
    
    fileprivate lazy var collectionView:UICollectionView = {[unowned self]in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 10   //行间距
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        //设置section内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionY = kStateBarH + kNavgationBarH + kMainTitleViewH + 10
        let collectionFrame = CGRect.init(x: 0, y: collectionY, width: kScreenW, height: kScreenH - collectionY)
        let collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        //注册cell
        collectionView.register(ShootListCollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        //注册header
        collectionView.register(ShootListCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
        }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



extension ShootListViewController {

    fileprivate func setupUI(){
        
        view.backgroundColor = kColorMainGrayBG
        automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "四季轮回"
        view.addSubview(pageTitleView)
        view.addSubview(collectionView)
    }
}

extension ShootListViewController :PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        
//        switch index {
//        case 0:
//            titleView.backgroundColor = kColorMainGreen
//        case 1:
//            titleView.backgroundColor = kColorMainRed
//        case 2:
//            titleView.backgroundColor = kColorMainGreen
//        case 3:
//            titleView.backgroundColor = kColorMainGreen
//        default: break
//        }
        
        model.shotListCellType = ShootListCellType(rawValue: index)!
        collectionView.reloadData()
        print(model.shotListCellType)
    }
}

extension ShootListViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出section的headerView
        var headerView = ShootListCollectionReusableView()
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! ShootListCollectionReusableView
        
        var word    = String()
        var title   = String()
        
        switch model.shotListCellType {
        case .Spring:
            word    = "春"
            title   = "春花秋月何时了？往事知多少"
        case .Summer:
            word    = "夏"
            title   = "小娘停棹濯纤指，水底，见花红"
        case .Autumn:
            word    = "秋"
            title   = "稻花香里说丰年，听取蛙声一片"
        case .winer:
            word    = "冬"
            title   = "华发寻春喜见梅，一株临路雪倍堆"
        }
        headerView.labWord.text  = word
        headerView.labTitle.text = title
        
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :ShootListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! ShootListCollectionViewCell
        
        var imgName = String()
        
        switch model.shotListCellType {
            
        case .Spring:   imgName = "spring\(indexPath.row+1).jpeg"
        case .Summer:   imgName = "summer\(indexPath.row+1).jpg"
        case .Autumn:   imgName = "autumn\(indexPath.row+1)"
        case .winer :   imgName = "winer\(indexPath.row+1).jpg"
            
        }
        
        cell.ivImg.image = UIImage(named:imgName)
        cell.labAuthorName.text = "作者： XXX"
        cell.labImgName.text = "图片的名字"
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
  
    }
    
}


