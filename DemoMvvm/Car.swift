//
//  Car.swift
//  DemoMvvm
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import Foundation

class Car {
    var model: String
    var make: String
    var kilowatts: Int
    var photoURL: String
    
    init(model: String, make: String, kilowatts: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.kilowatts = kilowatts
        self.photoURL = photoURL
    }
}