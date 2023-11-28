//
//  File.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

import XCTest

class UITestCase: XCTestCase {
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
}
