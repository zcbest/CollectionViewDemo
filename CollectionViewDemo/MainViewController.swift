//
//  ViewController.swift
//  MyCollectionViewDemo
//
//  Created by 曾超 on 16/1/14.
//  Copyright © 2016年 zengchao. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    //屏幕的宽和高
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载UICollectionView
        loadCollectionView()
    }

    func loadCollectionView(){
        //定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: width/2, height: height/3)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .Vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距
        layout.minimumLineSpacing = 0
        //定义一个UICollectionView
        let collectionView = UICollectionView(frame: CGRectMake(0,0,width,height), collectionViewLayout: layout)
        //设置collectionView的背景颜色
        collectionView.backgroundColor = UIColor.whiteColor()
        
        //设置collectionView的代理和数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //CollectionViewCell的注册
        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        //header的注册
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        
        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    // #MARK: --UICollectionViewDataSource的代理方法
    /**
    - 该方法是可选方法，默认为1
    - returns: CollectionView中section的个数
    */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.row + 2).png")
        cell.label.text = "美景\(indexPath.row + 1)"
        
        return cell
    }
    
    /**
     - returns: 返回headview或者footview
     */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", forIndexPath: indexPath)
        headView.backgroundColor = UIColor.whiteColor()
        
        return headView
    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
    Description:当点击某个Item之后的回应
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("(\(indexPath.section),\(indexPath.row))")
    }
    
    //#MARK: --UICollectionViewDelegateFlowLayout的代理方法
    /**
     - returns: header的大小
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: width, height: 17)
    }
    /**
     Description:可以定制不同的item
     
     - returns: item的大小
     */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if  indexPath.row % 2 == 1{
            return CGSize(width: width/2, height: height/3)
        }
        else{
            return CGSize(width: width/2, height: height/2)
        }
    }
}

