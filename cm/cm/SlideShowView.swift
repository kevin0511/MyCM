//
//  SlideShowView.swift
//  cm
//
//  Created by kevin.zhang on 2017/5/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class SlideShowView: UIView {

    var arrImgs = [UIImage]()
    var ivLeft,ivMiddle,ivRight : UIImageView?
    
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize.init(width: 1000, height: 60)
        return scrollView
    }()
    
    init(frame:CGRect , imgs:[UIImage]) {
        
        arrImgs = imgs
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SlideShowView {

    fileprivate func setupUI(){
        
        scrollView.frame = bounds
        scrollView.contentSize = CGSize.init(width: bounds.size.width * 3, height: bounds.size.height)
        self.addSubview(scrollView)
        setupImgs()
    }
    
    private func setupImgs(){
    
        ivLeft = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: bounds.size.height))
        ivLeft?.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        scrollView.addSubview(ivLeft!)
        
        ivMiddle = UIImageView.init(frame: CGRect.init(x: kScreenW, y: 0, width: kScreenW, height: bounds.size.height))
        ivMiddle?.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        scrollView.addSubview(ivMiddle!)
        
        ivRight = UIImageView.init(frame: CGRect.init(x: kScreenW * 2, y: 0, width: kScreenW, height: bounds.size.height))
        ivRight?.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        scrollView.addSubview(ivRight!)
        
    }
    
}
