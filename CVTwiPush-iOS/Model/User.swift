//
//  User.swift
//  CVTwiPush
//
//  Created by 范艺晨 on 2020/10/9.
//

import Foundation
import SwiftUI

struct User:Identifiable{
    var id:Int64
    var name:String
    var avatarURL:String?
    var jobs:[RTGroup.Job]?
}
