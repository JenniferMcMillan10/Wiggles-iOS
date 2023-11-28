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
    func inActivity<T>(named name: String, block: () -> T) -> T {
        return XCTContext.runActivity(named: "\(Self.self) \(name)") { _ in
            block()
        }
    }
    
    // Scrolling
    
    private enum Constants {
        static let topOffset = CGVector(dx: 0.5, dy: 0.4)
        static let bottomOffset = CGVector(dx: 0.5, dy: 0.8)
    }

    var screenTopCoordinate: XCUICoordinate {
        return app.coordinate(withNormalizedOffset: Constants.topOffset)
    }

    var screenBottomCoordinate: XCUICoordinate {
        return app.coordinate(withNormalizedOffset: Constants.bottomOffset)
    }

    func scrollDownTo(element: XCUIElement, maxScrolls: Int = 3) {
        for _ in 0 ..< maxScrolls {
            if element.exists, element.isHittable { break }
            screenBottomCoordinate.press(forDuration: 0.1, thenDragTo: screenTopCoordinate)
        }
    }
}
