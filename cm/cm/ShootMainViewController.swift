//
//  ShootMainViewController.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

private let kItemW                  = (kScreenW - 3 * kItemMargin)/2
private let kItemH                  = kItemW * 0.8
private let kItemMargin  : CGFloat  = 10
private let kHeaderViewH : CGFloat  = 50
private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kCellTag      = 1000

class ShootMainViewController: UIViewController {
    
    let vm      = ShootViewModel()
    let model   = ShootModel()
    
    fileprivate lazy var pageTitleView: PageTitleView = {[weak self] in
        
        let titleFrame = CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                                width: kScreenW, height: kMainTitleViewH)
        let titles = ["四季","航拍","乡镇"]
        let titleView = PageTitleView(frame: titleFrame,
                                      titles: titles)
        titleView.delegate = self
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
        collectionView.register(ShootCollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        //注册header
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
        }()

    fileprivate lazy var collectionHead:ShootCollectionHeaderView = {[weak self] in
        let head = ShootCollectionHeaderView.init(frame: CGRect.init(x: 10, y: 0, width: kScreenW-20, height: kHeaderViewH))
        head.backgroundColor = UIColor.white
        return head
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.model = model
        setupUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ShootMainViewController {
    
    fileprivate func setupUI(){
        
        automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "崇明摄协"
        view.addSubview(pageTitleView)
        pageTitleView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    }
}

extension ShootMainViewController :PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        
        self.model.cellType = ShootCellType(rawValue: index)!

    }
}


extension ShootMainViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出section的headerView
        let headerView :UICollectionReusableView
        
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        headerView.addSubview(collectionHead)

        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :ShootCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! ShootCollectionViewCell
        
        var imgName = String()
        
        switch indexPath.section {
        case 0:imgName = "spring\(indexPath.row+1).jpeg"
        case 1:imgName = "summer\(indexPath.row+1)"
        case 2:imgName = "autumn\(indexPath.row+1)"
        case 3:imgName = "winer\(indexPath.row+1)"
        default:
            break
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
