//
//  TwitterStatus.swift
//  CVTwiPush
//
//  Created by 范艺晨 on 2020/10/9.
//

import Foundation

struct TwitterStatus:Identifiable{
    var id:Int64
    var author:TwitterUser
    var created_at:String
    var full_text:String
    var in_reply_to_status_id:String?
    var in_reply_to_user_id:String?
    var in_reply_to_screen_name:String?
    var quoted_status_id:String?
    var media:[TwitterMedia]?
    var external_urls:[String]?
    var user_mentions:[String]?
    var hashtags:[String]?
}
