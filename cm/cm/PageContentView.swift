//
//  PageContentView.swift
//  DouYu
//
//  Created by kevin.zhang on 2017/3/15.
//  Copyright © 2017年 kevin.zhang. All rights reserved.
//

import UIKit

protocol PageContentViewDelegate : class {
    func pageContentView(contentView:PageContentView,
                         progress   :CGFloat,
                         sourceIndex:Int ,
                         targetIndex:Int)
}

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    fileprivate var childVcs:[UIViewController]
    fileprivate weak var parentViewController : UIViewController!
    fileprivate var startOffsetX : CGFloat = 0
    fileprivate var isForbidScrollDelegate : Bool = false
    weak var delegate : PageContentViewDelegate?
    
    // mark: 懒加载属性
    /*
        闭包中使用self  可能会引起循环引用  需要 [weak self] in
     */
    fileprivate lazy var collectionView : UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame:CGRect.zero,collectionViewLayout:layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled  = true
        collectionView.bounces          = false
        collectionView.dataSource       = self
        collectionView.delegate         = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    
    init(frame: CGRect , childVcs:[UIViewController],parentViewController:UIViewController?) {
        
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// UI
extension PageContentView{
    
    fileprivate func setupUI(){

        for childVc in childVcs{
            parentViewController.addChildViewController(childVc)
        }

        addSubview(collectionView)
        collectionView.frame = bounds
    }
}
// UICollectionView  代理
extension PageContentView : UICollectionViewDataSource{

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        
        return cell
    }
}

extension PageContentView : UICollectionViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isForbidScrollDelegate = false
        
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //-0-判断是否是点击事件
        if isForbidScrollDelegate {return}
        
        //-1-定义需要的数据
        var progress    : CGFloat   = 0     //滑动比例
        var sourceIndex : Int       = 0     //滑动到了 第几页
        var targetIndex : Int       = 0     //标题的位置数字
        
        //-2-判断左 还是 右
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        
        if currentOffsetX > startOffsetX {  //左滑
            //floor(1.6) = 1   取整数  -3- 计算需要的数据
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            sourceIndex = Int(currentOffsetX/scrollViewW)
            targetIndex = sourceIndex + 1
            
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            // -4- 完全划过去
            if currentOffsetX - startOffsetX == scrollViewW {
                progress = 1
                targetIndex = sourceIndex
            }
        }
        else {
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            targetIndex = Int(currentOffsetX / scrollViewW)
            sourceIndex = targetIndex + 1
            
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
        }
        
        print(" ---\n progress    : \(progress)\n sourceIndex : \(sourceIndex)\n targetIndex :\(targetIndex)")
        delegate?.pageContentView(contentView:  self,
                                  progress:     progress,
                                  sourceIndex:  sourceIndex,
                                  targetIndex:  targetIndex)
    }

}

// 外部调用
extension PageContentView{

    func setCurrentIndex(currentIndex: Int){
        //也可以
        //collectionView.contentOffset.x = CGFloat(currentIndex) * collectionView.frame.size.width
        
        //记录需要禁止执行代理的方法
        isForbidScrollDelegate = true
        
        //滚动到正确的位置
        let offsetX = CGFloat(currentIndex) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x:offsetX,y:0), animated: false)
    }
}

/*
    isForbidScrollDelegate
    在点击 PageTitleView的时候 pageConentView 会通过代理执行
    滑动的时候  标题的颜色渐变和
    设置这个属性 主要是禁止 点击titleview 的时候  颜色的渐变
 */



