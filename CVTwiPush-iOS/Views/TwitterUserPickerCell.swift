//
//  TwitterUserPickerCell.swift
//  CVTwiPush-iOS
//
//  Created by 范艺晨 on 2020/10/27.
//

import UIKit

class TwitterUserPickerCell: UIView {
    
    @IBOutlet weak var twitterUserAvatarImageView: UIImageView!
    @IBOutlet weak var twitterUserName: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    class func loadFromNib() -> TwitterUserPickerCell? {
        return Bundle.main.loadNibNamed("TwitterUserPickerCell", owner: self, options: nil)?.first as? TwitterUserPickerCell
    }

}
