//
//  TwitterUser.swift
//  CVTwiPush
//
//  Created by 范艺晨 on 2020/10/9.
//

import Foundation
import UIKit

struct TwitterUser:Identifiable,Hashable{
    var id:Int64
    var name:String
    var screen_name:String?
    var name_in_group:String?
    var avatar_url:String?
    
    var cached_avatar:UIImage?
}
