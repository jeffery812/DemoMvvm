//
//  Car.swift
//  DemoMvvm
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import RxSwift
import RxCocoa
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

class CarViewModel {
    private var car: Car
    static let horsepowerPerKilowatt = 1.34102209

    let disposeBag = DisposeBag()
    
    var modelText: BehaviorSubject<String>
    var makeText: BehaviorSubject<String>
    var horsepowerText: BehaviorSubject<String>
    var kilowattText: BehaviorSubject<String>
    var titleText: BehaviorSubject<String>
    
    
    var photoURL: NSURL? {
        return NSURL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
        
        // 1
        modelText = BehaviorSubject<String>(value: car.model)   // initializing with the current value of car.model
        modelText.subscribeNext { (model) in
            car.model = model                                   // subscribing to changes in modelText which will be reflected in CarViewModel's car
            }.addDisposableTo(disposeBag)
        
        // 2
        makeText = BehaviorSubject<String>(value: car.make)
        makeText.subscribeNext { (make) in
            car.make = make
            }.addDisposableTo(disposeBag)
        
        // 3
        titleText = BehaviorSubject<String>(value: "\(car.make) \(car.model)")
        [makeText, modelText].combineLatest { (carInfo) -> String in
            return "\(carInfo[0]) \(carInfo[1])"
            }.bindTo(titleText).addDisposableTo(disposeBag)
        
        // 4
        horsepowerText = BehaviorSubject(value: "0")
        kilowattText = BehaviorSubject(value: String(car.kilowatts))
        kilowattText.map({ (kilowatts) -> String in
            let kw = Int(kilowatts) ?? 0
            let horsepower = max(Int(round(Double(kw) * CarViewModel.horsepowerPerKilowatt)), 0)
            return "\(horsepower) HP"
        }).bindTo(horsepowerText).addDisposableTo(disposeBag)
        
    }
    
}