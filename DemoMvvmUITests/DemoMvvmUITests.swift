//
//  DemoMvvmUITests.swift
//  DemoMvvmUITests
//
//  Created by Zhihui Tang on 2016-10-12.
//  Copyright © 2016 Zhihui Tang. All rights reserved.
//

import XCTest

@testable import DemoMvvm

//http://candycode.io/a-practical-mvvm-example-in-swift-part-1/

class DemoMvvmUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCarViewModelWithFerrariF12() {
        let ferrariF12 = Car(model: "F12", make: "Ferrari", kilowatts: 730, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariViewModel = CarViewModel(car: ferrariF12)
        
        XCTAssertEqual(ferrariViewModel.modelText, "F12")
        XCTAssertEqual(ferrariViewModel.makeText, "Ferrari")
        XCTAssertEqual(ferrariViewModel.horsepowerText, "979 HP")
        XCTAssertEqual(ferrariViewModel.photoURL, NSURL(string: ferrariF12.photoURL))
        XCTAssertEqual(ferrariViewModel.titleText, "Ferrari F12")
    }
    
    func testFerrariF12DataDisplayed() {
        let app = XCUIApplication()
        let table = app.tables.elementBoundByIndex(0)
        
        let ferrariCell = table.cells.elementBoundByIndex(0)
        XCTAssert(ferrariCell.staticTexts["Ferrari F12"].exists)
        XCTAssert(ferrariCell.staticTexts["979 HP"].exists)
        
        let zondaCell = table.cells.elementBoundByIndex(1)
        XCTAssert(zondaCell.staticTexts["Pagani Zonda F"].exists)
        XCTAssert(zondaCell.staticTexts["807 HP"].exists)
        
        let lamboCell = table.cells.elementBoundByIndex(2)
        XCTAssert(lamboCell.staticTexts["Lamborghini Aventador"].exists)
        XCTAssert(lamboCell.staticTexts["939 HP"].exists)
    }
}
