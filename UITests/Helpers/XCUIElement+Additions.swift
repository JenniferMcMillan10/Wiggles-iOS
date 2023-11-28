//
//  XCUIElement+Additions.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

import XCTest

extension XCUIElement {
    
    @discardableResult
    func assertItemIsDisplayed(file: StaticString = #file, line: UInt = #line) -> Self {
        XCTAssertTrue(exists, "\(self) not found", file: file, line: line)
        return self
    }
    
    @discardableResult
    func assertItemIsDisplayedWithText(text: String, file: StaticString = #file, line: UInt = #line) -> Self{
        assertItemIsDisplayed()
        XCTAssertEqual(label, text, "Text found was \(label) but expected \(text)", file: #file, line: #line)
        return self
    }
    
    @discardableResult
    func tapItem(file: StaticString = #file, line: UInt = #line) -> Self {
        assertItemIsDisplayed()
        XCTAssert(isHittable, "Element \(self) is not hittable", file: file, line: line)
        tap()
        return self
    }
    
    @discardableResult
    func waitForAndAssertExistence(file: StaticString = #file, line: UInt = #line) -> Self {
        let timeout = 7.0
        XCTAssert(waitForExistence(timeout: timeout), "\(self) did not exist on screen within the time \(timeout) seconds", file: file, line: line)
        return self
    }
}
