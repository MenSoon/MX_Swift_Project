//
//  ZeroViewController.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit
let viewWidth = UIScreen.mainScreen().bounds.size.width
let viewHeight = UIScreen.mainScreen().bounds.size.height

class ZeroViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataSourceArr = NSMutableArray()
    var myTableView:UITableView?
    var refreshControl:UIRefreshControl?
    // 加载更多 状态 风火轮
    var _aiv:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        initView()
        requestUrl("http://www.yishu.com/Api/Auction/hotAuctionList&verson=1.08&tagClient=APP&device=ios")
        creatRefresh()
        // Do any additional setup after loading the view.
    }
    func creatRefresh(){
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
        self.refreshControl?.tintColor = UIColor.grayColor()
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        myTableView?.addSubview(refreshControl!)
        
    // 加载更多按扭的背景视图
         var tableFooterView:UIView = UIView()
         tableFooterView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44)
         tableFooterView.backgroundColor = UIColor.whiteColor()
         self.myTableView!.tableFooterView = tableFooterView

         // 加载更多的按扭
         let loadMoreBtn = UIButton()
         loadMoreBtn.frame = CGRectMake(0, 0, self.view.bounds.width, 44)
         loadMoreBtn.setTitle("Load More", forState: .Normal)
         loadMoreBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
         loadMoreBtn.addTarget(self, action: "loadMore:", forControlEvents: .TouchUpInside)
         tableFooterView.addSubview(loadMoreBtn)

         // 加载更多 状态 风火轮
         _aiv = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
         _aiv.center = loadMoreBtn.center
         tableFooterView.addSubview(_aiv)
    }
    
    //下拉刷新方法
    func refresh(){
        if self.refreshControl?.refreshing == true
        {
        
            self.refreshControl?.attributedTitle = NSAttributedString(string: "加载中...")
        }
        dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
            
                         //self.dataSourceArr.insert("\(self.dataSourceArr[0].toInt()! - 1)", atIndex: 0)
            
                         dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                                 sleep(1)
                
                                self.refreshControl?.endRefreshing()
                                 self.refreshControl?.attributedTitle = NSAttributedString(string: "翔哥为你加载..")
                                 self.myTableView!.reloadData()
                            })
                     })
    }
    
    
    // 加载更多方法
     func loadMore(sender:UIButton) {

             sender.hidden = true
             _aiv.startAnimating()

             dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
        
                     //self.self.dataSourceArr.insert.append("\(self.self.dataSourceArr!.insert[self._dataSource.count-1].toInt()! + 1)")
        
                     dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
                             sleep(1)
            
                             self._aiv.stopAnimating()
                             sender.hidden = false
                             self.myTableView!.reloadData()
                         })
                 })
         }
    
    
    func requestUrl(urlString:String){
        var url:NSURL = NSURL(string: urlString)!
        let request:NSURLRequest = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respose, data, error) -> Void in
            var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
           // println(dict)
            //判断
            if dict as NSObject == NSNull(){
               self.showAlertView("提示", message: "网络错误")
                return
            }
            var arr = dict["data"] as! NSArray
            
            for data : AnyObject in arr{
                var model:ZeroModel = ZeroModel()
                model.setValuesForKeysWithDictionary(data as! [NSObject : AnyObject])
                self.dataSourceArr.addObject(model)
            }
           // println(self.dataSourceArr)
            var model:ZeroModel = self.dataSourceArr.objectAtIndex(0) as! ZeroModel
           // println((model.special_name))
            
            self.myTableView?.reloadData()
            
        }
    }
     func showAlertView(title:String,message:String) {
        var alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("确定")
        alert.show()
    }
    
    func initView(){
        
        var titleLabel:UILabel = UILabel(frame:CGRectMake(0, 0, 80, 40))
        titleLabel.text = "亮亮"
        self.navigationController?.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
       
        myTableView = UITableView(frame: CGRectMake(0, 0, viewWidth, viewHeight-49))
        self.view.addSubview(myTableView!)
        myTableView?.delegate = self
        myTableView?.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArr.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //System
//        let cellID:String = "cellID"
//        let cell:UITableViewCell  = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellID)
//        cell.textLabel?.text = String(indexPath.row)
//        return cell
        
        //Custom_Style
        let cellID:String = "ZeroCell"
        //var nib = UINib(nibName: "ZeroCell", bundle: nil)
        tableView.registerNib(UINib(nibName: "ZeroCell", bundle: nil), forCellReuseIdentifier: cellID)
        var cell:ZeroCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! ZeroCell
        var model:ZeroModel = self.dataSourceArr[indexPath.row] as! ZeroModel

        cell.showDataModel(model)
       // println(model.special_name)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
