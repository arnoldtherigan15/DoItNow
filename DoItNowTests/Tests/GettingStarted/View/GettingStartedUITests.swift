//
//  GettingStartedUITests.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import XCTest

final class GettingStartedUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testGetStartedNavigatesToRegister() {
        sleep(2) // wait splash
        let button = app.buttons["Get Started"]
        XCTAssertTrue(button.waitForExistence(timeout: 3))
        button.tap()

        let registerLabel = app.staticTexts["Register"]
        XCTAssertTrue(registerLabel.waitForExistence(timeout: 3))
    }
}
