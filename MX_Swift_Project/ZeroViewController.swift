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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        initView()
        requestUrl("http://www.yishu.com/Api/Auction/hotAuctionList&verson=1.08&tagClient=APP&device=ios")
        // Do any additional setup after loading the view.
    }
    func requestUrl(urlString:String){
        var url:NSURL = NSURL(string: urlString)!
        let request:NSURLRequest = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respose, data, error) -> Void in
            var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            println(dict)
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
            println(self.dataSourceArr)
            var model:ZeroModel = self.dataSourceArr.objectAtIndex(0) as! ZeroModel
            println((model.special_name))
            
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
//        tableView.registerNib(UINib(nibName: "ZeroCell", bundle: nil));, forCellReuseIdentifier: cellID)
        //var nib = UINib(nibName: "ZeroCell", bundle: nil)
        tableView.registerNib(UINib(nibName: "ZeroCell", bundle: nil), forCellReuseIdentifier: cellID)
        var cell:ZeroCell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! ZeroCell
        var model:ZeroModel = self.dataSourceArr[indexPath.row] as! ZeroModel
        cell.special_nameLabel.text = model.special_name
        cell.thumbImageView.setImage("http://www.yishu.com\(model.thumb!)", placeHolder: nil)
        println(model.special_name)
        return cell
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
