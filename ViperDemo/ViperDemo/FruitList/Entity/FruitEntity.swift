//
//  Fruit.swift
//  ViperDemo
//
//  Created by Abhisek on 08/11/17.
//  Copyright © 2017 Abhisek. All rights reserved.
//

import UIKit
import RealmSwift

class Fruit: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String = ""
    @objc dynamic var vitamin : String = ""
    
    convenience init(id: Int, name : String, vitamin: String) {
        self.init()
        self.id = id
        self.name = name
        self.vitamin = vitamin
    }
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
