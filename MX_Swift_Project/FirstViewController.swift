//
//  FirstViewController.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var myCollectionView:UICollectionView?
    var cell:FirstCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVIew()
        // Do any additional setup after loading the view.
    }
    func initVIew(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(90, 100)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical//设置垂直显示
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 1, 0, 1)//设置边距
        flowLayout.minimumLineSpacing = 10;//每个相邻layout的上下
        flowLayout.minimumInteritemSpacing = 0.0;//每个相邻layout的左右
        flowLayout.headerReferenceSize = CGSizeMake(10, 10);
        

        myCollectionView = UICollectionView(frame: CGRectMake(0, 64, viewWidth, viewHeight-64-49), collectionViewLayout:flowLayout)
        self.myCollectionView!.alwaysBounceVertical = true
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        myCollectionView?.backgroundColor = UIColor.orangeColor()
        myCollectionView?.registerClass(FirstCell.self, forCellWithReuseIdentifier: "FirstCell")
        self.view.addSubview(myCollectionView!)
        //myCollectionView?.reloadData()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        return CGSizeMake(90, 100)
    }
//
//    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(10, 10, 10, 10);
//    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellID:String = "FirstCell"
        var cell:FirstCell = myCollectionView!.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! FirstCell
        myCollectionView?.registerNib(UINib(nibName: "FirstCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
