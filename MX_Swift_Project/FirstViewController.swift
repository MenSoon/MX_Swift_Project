//
//  FirstViewController.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit



/**
*  首先，在对应的第三方平台注册开发者，创建APP，配置app资料，然后下载sdk，会包含开发文档和demo，

然后将sdk导入工程，按照文档配置工程，

调用sdk跳转到qq，然后授权登录，然后跳转到自己app，自己app会有一个代理回调，获取登录成功以后的qq用户资料，包括qq的OpenID，昵称，头像，等等

将openid，提交到你们的服务器，这个openid是每个qq用户在qq第三方平台下的app的唯一标志

你们的服务器根据这个openID，创建在你们平台下的用户账号
*/
class FirstViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var myCollectionView:UICollectionView?
    var cell:FirstCell?
    var dataSource = NSMutableArray()
    var totalDataArr = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVIew()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        YRHttpRequest.requestWithURL("http://www.yishu.com/Api/Auction/specialGoodsList?special_id=2631&order_type=0&p=1&verson=1.08&tagClient=APP&device=ios", completionHandler: { (data) -> Void in
            
           
//            var dataArr = data["data"] as! NSArray
//            //println(dataArr)
//            
//            for dict :AnyObject in dataArr{
//                var special_listArr = dict["special_list"] as! NSArray
//                self.totalDataArr.addObject(special_listArr)
//            }
//            println(self.totalDataArr[0])
//            var special_listArr1 = self.totalDataArr[0] as! NSArray
//            for special_listDict : AnyObject in special_listArr1{
//                var model:FirstModel = FirstModel()
//                
//                model.setValuesForKeysWithDictionary(special_listDict as! [NSObject : AnyObject])
//                self.dataSource.addObject(model)
//            }
//            println(self.dataSource)
//            self.myCollectionView?.reloadData()
            if (data["data"] is NSArray){
                var dataArr = data["data"] as! NSArray
                for dict :AnyObject in dataArr{
                    var model:FirstModel = FirstModel()
                    model .setValuesForKeysWithDictionary(dict as! [NSObject : AnyObject])
                    self.dataSource.addObject(model)
                }
                println(self.dataSource)
                self.myCollectionView?.reloadData()
            }else{
                self.showAlertView("提示", message: "专场已结束")
            }
            
        })
        
    }
    
    func showAlertView(title:String,message:String) {
        var alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("确定")
        alert.show()
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
        return dataSource.count
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
        //************
//        var label:UILabel? = cell.contentView.viewWithTag(11) as? UILabel
//        if label == nil {
//            //非复用，创建并添加到contentView里
//            println("label == nil\(indexPath.item)")
//            label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
//            label!.tag = 11
//            label?.font = UIFont.systemFontOfSize(8)
//            cell.contentView.addSubview(label!)
//        
//        }
//        label!.text = "翔哥\(indexPath.item)"
        //***********
        var model:FirstModel = self.dataSource[indexPath.row] as! FirstModel
        
        cell.showDataModelInCell(model)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
