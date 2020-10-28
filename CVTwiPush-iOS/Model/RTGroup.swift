//
//  RTGroup.swift
//  CVTwiPush
//
//  Created by 范艺晨 on 2020/10/9.
//

import Foundation

struct RTGroup:Identifiable{
    var id:Int64
    var name:String
    var avatarURL:String
    var followingTwitterUsers:[Int64]
    var leader:User
    var tweetFormat:String
    
    struct Job{
        var groupId:String
        var jobName:String
        var priority:Int
    }
}
