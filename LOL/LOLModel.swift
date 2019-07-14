//
//  LOLModel.swift
//  LOL
//
//  Created by gdcp on 2018/4/18.
//  Copyright © 2018年 gdcp. All rights reserved.
//

import UIKit

class LOLModel: NSObject {
    var icon:String?
    var intro:String?
    var name:String?
    init(dict:[String:Any]) {
        super.init()
        self.icon = dict["icon"] as? String
        self.intro = dict["intro"] as? String
        self.name = dict["name"] as? String
    }
    
}
