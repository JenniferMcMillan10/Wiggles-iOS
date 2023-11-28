//
//  DogDetailsScreen.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

import XCTest

class DogDetailsScreen: BaseScreen {
    
    // UI Elements
    
    private var backButton: XCUIElement { app.buttons["back_icon"]}
    private var faveButton: XCUIElement { app.buttons["fav_icon"]}
    private var messageButton: XCUIElement { app.buttons["msg_icon"] }
    private var adoptMeButton: XCUIElement { app.buttons["Adopt me"] }
    
    private func dogNameTitle(name: String) -> XCUIElement { app.staticTexts[name] }
    
    // Step defs
    
    @discardableResult
    func assertOnDetailsScreen(name: String) -> Self {
        inActivity(named: "Assert that user is on the details screen for \(name)") {
            dogNameTitle(name: name).waitForAndAssertExistence()
        }
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self {
        inActivity(named: "Tap back button") {
            backButton.tapItem()
        }
        return self
    }
    
    @discardableResult
    func tapFaveButton() -> Self {
        inActivity(named: "Tap fave button") {
            faveButton.tapItem()
            // TODO: assert change
        }
        return self
    }
    
    @discardableResult
    func tapMessageButton() -> Self {
        inActivity(named: "Tap messages button") {
            scrollDownTo(element: messageButton)
            messageButton.tapItem()
        }
        return self
    }
    
    @discardableResult
    func tapAdoptMeButton() -> Self {
        inActivity(named: "Tap Adopt me button") {
            scrollDownTo(element: adoptMeButton)
            adoptMeButton.tapItem()
        }
        return self
    }
}
