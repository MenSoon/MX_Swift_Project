//
//  ZeroCell.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit

class ZeroCell: UITableViewCell {
    var ZeroModelData:ZeroModel!
    
    @IBOutlet weak var special_nameLabel: UILabel!
    
    @IBOutlet weak var thumbImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func showDataModel(){
//        self.special_nameLabel.text = ZeroModelData.special_name
//        var url = "http://www.yishu.com\(ZeroModelData?.thumb)"
        //println(url)
        //self.thumbImageView!.setImage(url, placeHolder: nil)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
