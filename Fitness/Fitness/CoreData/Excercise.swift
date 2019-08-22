//
//  File.swift
//  Fitness
//
//  Created by Duc'sMacBook on 6/28/19.
//  Copyright © 2019 Duc'sMacBook. All rights reserved.
//

import Foundation

class Excercise{
    
    var image:String
    var name:String
    var id:Int
    
    init(name:String, image:String, id:Int) {
        self.id = id
        self.name = name
        self.image = image
    }
    
}
