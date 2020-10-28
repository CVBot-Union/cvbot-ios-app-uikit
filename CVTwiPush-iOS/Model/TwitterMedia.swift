//
//  TwitterMedia.swift
//  CVTwiPush
//
//  Created by 范艺晨 on 2020/10/9.
//

import Foundation
import UIKit

struct TwitterMedia:Identifiable,Hashable{
    var id:Int64
    var url:String
    var preview_image_url:String
    var type:TwitterMediaType
    var cached_image_preview:UIImage?
    var cached_image:UIImage?
    
    enum TwitterMediaType{
        case image
        case video
    }
}
