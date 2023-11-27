//
//  BaseScreen.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

import XCTest

class BaseScreen {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    @discardableResult
    func inActivity<T>(named name: String, block: () -> T) -> T { // do we need the block?
        return XCTContext.runActivity(named: "\(Self.self) \(name)") { _ in
            block()
        }
    }
}
