//
//  FirstCell.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/24.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit

class FirstCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//    }
//
    func showDataModelInCell(model:FirstModel){
        
        var imageView:UIImageView? = self.contentView.viewWithTag(222) as? UIImageView
        if imageView == nil{
            imageView = UIImageView(frame: CGRectMake(0, 0, 90, 100))
            imageView?.tag = 222
            self.contentView.addSubview(imageView!)
        }
        imageView?.setImage("http://www.yishu.com\(model.thumb!)", placeHolder: nil)
        
        var label:UILabel? = self.contentView.viewWithTag(11) as? UILabel
        if label == nil {
            //非复用，创建并添加到contentView里
            label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
            label!.tag = 11
            label?.textColor = UIColor.whiteColor()
            label?.font = UIFont.systemFontOfSize(10)
            self.contentView.addSubview(label!)
            
        }
        label!.text = model.goods_name
    }
}
