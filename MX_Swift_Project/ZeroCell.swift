//
//  ZeroCell.swift
//  MX_Swift_Project
//
//  Created by yishu on 15/7/22.
//  Copyright (c) 2015年 mengxiang. All rights reserved.
//

import UIKit

class ZeroCell: UITableViewCell {
    @IBOutlet weak var special_nameLabel: UILabel!
    
    @IBOutlet weak var hitsLabel: UILabel!
    @IBOutlet weak var bidtimesLabel: UILabel!
    @IBOutlet weak var special_praiseButton: UIButton!
    @IBOutlet weak var goods_countLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func showDataModel(ZeroModelData:ZeroModel){
        self.special_nameLabel.text = ZeroModelData.special_name!
        self.thumbImageView.setImage("http://www.yishu.com\(ZeroModelData.thumb!)", placeHolder: nil)
        self.hitsLabel.text = ZeroModelData.hits!
        self.bidtimesLabel.text = ZeroModelData.bidtimes!
        self.goods_countLabel.text = ZeroModelData.goods_count!
       
        self.special_praiseButton.setTitle("\(ZeroModelData.special_praise!)", forState: UIControlState.Normal)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
