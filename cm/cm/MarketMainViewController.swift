//
//  ExportMainViewController.swift
//  CM
//
//  Created by Kevin on 2017/5/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

private let kItemMargin:CGFloat = 10
private let kItemW = (kScreenW - 3 * kItemMargin)/2
private let kItemH = kItemW * 1.5 + 10
private let kHeaderViewH : CGFloat = 50
private let kTopViewH : CGFloat = 140

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
private let kCellTag      = 1000


class MarketMainViewController: UIViewController {
    
    fileprivate lazy var topBtnsView:MarketClassifiedBtnsView = {[weak self] in
    
        let frame =  CGRect(x: 0, y:kStateBarH + kNavgationBarH,
                            width: kScreenW, height: kTopViewH)
        let view = MarketClassifiedBtnsView(frame :frame)
        view.backgroundColor = UIColor.white
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
        collectionView.register(MarketCollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        //注册header
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
        }()
    
    
    fileprivate lazy var collectionHead:MarketCollectionHeaderView = {[weak self] in
        let head = MarketCollectionHeaderView.init(frame: CGRect.init(x: 10, y: 0, width: kScreenW-20, height: kHeaderViewH))
        head.backgroundColor = UIColor.white
        return head
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


extension MarketMainViewController {

    fileprivate func setupUI(){
        
        view.backgroundColor = UIColor(r:245 ,g:245 ,b:245 )
        automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "当季推荐"
        
        view.addSubview(topBtnsView)
        view.addSubview(collectionView)
        
    }
}


extension MarketMainViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //取出section的headerView
        let headerView :UICollectionReusableView
        
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        view.backgroundColor = UIColor(r:245 ,g:245 ,b:245 )
        headerView.addSubview(collectionHead)
        collectionHead.title.text = "活动推荐"
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell :MarketCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! MarketCollectionViewCell
        
        let imgName = "marketCell\(indexPath.row+1)"
        cell.imgView.image = UIImage(named:imgName)
        cell.ivTag.image = UIImage(named:"market_tag1")
        cell.shoppingCart.tag = kCellTag + indexPath.row
        cell.shoppingCart.addTarget(self, action: #selector(cellBtnAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc private func cellBtnAction(sender:UIButton){
        print("购物车\(sender.tag - kCellTag)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
