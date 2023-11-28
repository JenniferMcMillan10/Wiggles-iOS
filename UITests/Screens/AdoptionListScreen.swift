//
//  AdoptionListScreen.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

import XCTest

class AdoptionListScreen: BaseScreen {
    
    // UI Elements

    private func title(name: String) -> XCUIElement { app.staticTexts["Hey \(name),"] }
    
    private func dogButton(name: String) -> XCUIElement { app.buttons[name] }
    
    // Step defs
    
    @discardableResult
    func assertOnMainScreen(name: String) -> Self {
        inActivity(named: "Assert I am on the correct screen for user \(name)") {
            title(name: name).waitForAndAssertExistence()
        }
        return self
    }
    
    @discardableResult
    func assertDogSummaryIsShown(name: String, contentDescription: String) -> Self {
        inActivity(named: "Assert I am on the correct screen for user \(name)") {
            dogButton(name: name).assertItemIsDisplayedWithText(text: contentDescription)
        }
        return self
    }
    
    @discardableResult
    func tapOnDog(name: String) -> Self {
        inActivity(named: "Assert I am on the correct screen for user \(name)") {
            dogButton(name: name).tapItem()
        }
        return self
    }
}
