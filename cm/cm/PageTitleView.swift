//
//  PageTitleView.swift
//  DouYu
//
//  Created by kevin.zhang on 2017/3/15.
//  Copyright © 2017年 kevin.zhang. All rights reserved.
//

import UIKit

//  MARK:- 定义协议
protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView:PageTitleView,selectedIndex index:Int)
}


//  MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat,CGFloat,CGFloat) = (170,170,170)        //元组
private let kSelectColor : (CGFloat,CGFloat,CGFloat) = (68,188,180) 

//  MARK:- 定义PageTitleView类
class PageTitleView: UIView {
    
    fileprivate let numberTag:Int = 1000
    fileprivate var kLabWidth:CGFloat = 80
    fileprivate var titles:[String]                 //定义属性
    fileprivate var currentIndex : Int = 0
    weak var delegate : PageTitleViewDelegate?      //代理用weak
    
    //如果在其他地方也用到的话  用懒加载
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentSize = CGSize.init(width: 1000, height: 60)
        return scrollView
    }()
    
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = kColorMainGreen
        return scrollLine
    }()
    
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    //自定义 构造函数
    init(frame: CGRect , titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageTitleView{
    
    fileprivate func setupUI(){
        
        kLabWidth = kScreenW / CGFloat(titles.count)
        
        addSubview(scrollView)                  //1- 添加  scrollview
        scrollView.frame = bounds
        scrollView.contentSize = CGSize.init(width: kLabWidth * CGFloat(titles.count), height: frame.height)
        setupTitleLabels()                      //2- 添加 label
        setupBottomLineAndScrollLine()          //3- 设置 底线和滚动的滑块
    }
    
    private func setupTitleLabels(){
        
        let labW : CGFloat = kLabWidth
        let labH : CGFloat = frame.height
        let labY : CGFloat = 0
        
        for (index , title) in titles.enumerated(){
            let label = UILabel()
            label.text = title
            label.tag = index + numberTag
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center

            let labX : CGFloat = labW * CGFloat(index)
            label.frame = CGRect(x: labX, y: labY, width: labW, height: labH-kScrollLineH)
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
        }
    }
 
    
    private func setupBottomLineAndScrollLine(){
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH:CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height-lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // let firstLab = titleLabels.first  是一个可选类型  需要做一个 校验
        guard let firstLab = titleLabels.first else {return}
        firstLab.textColor =  UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLab.frame.origin.x, y: frame.height-kScrollLineH, width: firstLab.frame.size.width, height: kScrollLineH)
    }
}

extension PageTitleView{
    func titleLabClick(tapGes:UITapGestureRecognizer){
        // 加入没有值  使用guard  -1-获取当前label
        guard let currentLab = tapGes.view as? UILabel else { return }
        currentLab.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        //-2-   获取灰色的label
        let oldLabel = titleLabels[currentIndex]
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        //-3-   保存label 的下标值
        currentIndex = currentLab.tag - numberTag
        //-4-   设置scrollLine的位置
        UIView.animate(withDuration: 0.2) {
            self.scrollLine.frame.origin.x =
                CGFloat(self.currentIndex) * self.scrollLine.frame.width
        }
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}

// MARK:- 对外方法
extension PageTitleView{
    
    func setCurrentTitleWithProgress(progress:CGFloat , sourceIndex:Int ,targetIndex:Int) {
        
        //-1- 取出2个label
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        //-2- 处理滑块
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        //-3- 颜色渐变
        // 3.1 取出变化范围
        let colorDelta = (kSelectColor.0-kNormalColor.0,
                          kSelectColor.1-kNormalColor.1,
                          kSelectColor.2-kNormalColor.2)
        
        // 3.2 变化 sourceLabel  橘黄色变灰色
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress,
                                        g: kSelectColor.1 - colorDelta.1 * progress,
                                        b: kSelectColor.2 - colorDelta.2 * progress)
        
        // 3.2 变化 targetLabel   灰色变橘黄色
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress,
                                        g: kNormalColor.1 + colorDelta.1 * progress,
                                        b: kNormalColor.2 + colorDelta.2 * progress)
        
        currentIndex = targetIndex
    }
}
