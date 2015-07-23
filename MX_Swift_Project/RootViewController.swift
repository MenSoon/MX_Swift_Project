//
//  RootViewController.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        initView()
        // Do any additional setup after loading the view.
    }

    func initView(){
        var offset:UIOffset = UIOffset()
        offset.horizontal = 0.0
        offset.vertical = -4.0;
        var original = UIImageRenderingMode.AlwaysOriginal
        var navcArr:NSArray = NSArray()
        
        
        var zeroVC:ZeroViewController = ZeroViewController()
        zeroVC.title = "红亮"
        zeroVC.tabBarItem.image = UIImage(named: "tabbar_icon_1")?.imageWithRenderingMode(original)
        zeroVC.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_2")?.imageWithRenderingMode(original)
        zeroVC.tabBarItem.setTitlePositionAdjustment(offset)
        zeroVC.tabBarController?.tabBar.tintColor = UIColor.blackColor()
        zeroVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Highlighted)
        var zeroVCNavc:UINavigationController = UINavigationController(rootViewController: zeroVC)
        
        
        var firstVC:FirstViewController = FirstViewController()
        firstVC.title = "峰峰"
        firstVC.tabBarItem.image = UIImage(named: "tabbar_icon_3")?.imageWithRenderingMode(original)
        firstVC.tabBarItem.setTitlePositionAdjustment(offset)
        firstVC.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_4")?.imageWithRenderingMode(original)
        firstVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Highlighted)
        var firstVCNavc:UINavigationController = UINavigationController(rootViewController: zeroVC)
        
        var secondVC:SecondViewController = SecondViewController()
        secondVC.title = "译译"
        secondVC.tabBarItem.image = UIImage(named: "tabbar_icon_5")?.imageWithRenderingMode(original)
        secondVC.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_6")?.imageWithRenderingMode(original)
        secondVC.tabBarItem.setTitlePositionAdjustment(offset)
        secondVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Highlighted)
        var secondVCNavc:UINavigationController = UINavigationController(rootViewController: zeroVC)
        
        var thirdVC:ThirdViewController = ThirdViewController()
        thirdVC.title = "翔翔"
        thirdVC.tabBarItem.image = UIImage(named: "tabbar_icon7")?.imageWithRenderingMode(original)
        thirdVC.tabBarItem.selectedImage = UIImage(named: "tabbar_icon8")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        thirdVC.tabBarItem.setTitlePositionAdjustment(offset)
        thirdVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor()], forState: UIControlState.Highlighted)
        var thirdVCNavc:UINavigationController = UINavigationController(rootViewController: zeroVC)
        for (var i = 0 ; i < 4 ; i++){
            
        }
        
        var VCArr:NSArray = NSArray()
        VCArr = [zeroVC,firstVC,secondVC,thirdVC]
        navcArr = [zeroVCNavc,firstVCNavc,secondVCNavc,thirdVCNavc]
        self.setViewControllers(VCArr as AnyObject as! [AnyObject], animated: true)
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
