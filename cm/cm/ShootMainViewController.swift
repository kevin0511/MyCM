//
//  ShootMainViewController.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

private let kItemW                  = (kScreenW - 3 * kItemMargin)/2
private let kItemH                  = kItemW / 5 * 3 + 28
private let kItemMargin  : CGFloat  = 10
private let kHeaderViewH : CGFloat  = 70
private let kTopViewH    : CGFloat   = 120
private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kCellTag      = 1000
private let kHeaderTag    = 2000

class ShootMainViewController: UIViewController {
    
    lazy var viewTop:UIView = {[weak self] in
        
        let view = UIView()
        let iv = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: kTopViewH))
        view .addSubview(iv)
        iv.image = UIImage(named:"shootTop")
        iv.contentMode = .scaleAspectFill
        return view
        
        }()
    
    fileprivate lazy var collectionView:UICollectionView = {[unowned self]in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 10   //行间距
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        //设置section内边距
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        let collectionY = kStateBarH + kNavgationBarH + kTopViewH + 10
        let collectionFrame = CGRect.init(x: 0, y: collectionY, width: kScreenW, height: kScreenH - collectionY)
        let collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        //注册cell
        collectionView.register(ShootMainCollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        //注册header
        collectionView.register(ShootMainCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ShootMainViewController {
    
    fileprivate func setupUI(){
        
        view.backgroundColor = kColorMainGrayBG
        automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "崇明摄协"
        
        view.addSubview(viewTop)
        viewTop.snp.makeConstraints { (make) in
            make.top.equalTo(kStateBarH+kNavgationBarH)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(kTopViewH)
        }
        
        view.addSubview(collectionView)
    }
}


extension ShootMainViewController:UICollectionViewDataSource,UICollectionViewDelegate{

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出section的headerView
        var headerView = ShootMainCollectionReusableView()
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! ShootMainCollectionReusableView

        var title       = String()
        var subTitle    = String()
        var imgName     = String()
        
        switch indexPath.section {
        case 0:
            title       = "四季轮回"
            subTitle    = "二十四节气"
            imgName     = "四季"
        case 1:
            title       = "航拍精选"
            subTitle    = "新的视角,新的发现"
            imgName     = "航拍"
        case 2:
            title       = "乡镇风景"
            subTitle    = "乡镇之美"
            imgName     = "乡镇"
        default:
            break
        }
        
        headerView.labTitle.text = title;
        headerView.labSubTitle.text = subTitle;
        headerView.ivTitle.image = UIImage(named:imgName)
        
        headerView.btnNext.tag = kHeaderTag + indexPath.section
        headerView.btnNext.addTarget(self, action: #selector(btnSectionAction(sender:)), for: .touchUpInside)

        
        return headerView
    }
    
    @objc private func btnSectionAction(sender:UIButton) {

        //let section = sender.tag - kHeaderTag
        
        self.navigationController?.pushViewController(ShootListViewController(), animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :ShootMainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! ShootMainCollectionViewCell
        
        var imgName = String()
        
        switch indexPath.section {
        case 0:imgName = "seasons\(indexPath.row+1).jpeg"
        case 1:imgName = "aerial\(indexPath.row+1).jpg"
        case 2:imgName = "spring\(indexPath.row+1)"
        default:
            break
        }
        
        cell.ivImg.image = UIImage(named:imgName)
        cell.labImg.text = "照片的名字"
        cell.labAuthor.text = "作者: 谁谁谁"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
