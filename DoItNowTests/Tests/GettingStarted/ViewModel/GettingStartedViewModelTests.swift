//
//  GettingStartedViewModelTests.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import XCTest
@testable import DoItNow

final class GettingStartedViewModelTests: XCTestCase {

    func testInitialSlideIndexIsZero() {
        let vm = GettingStartedViewModel()
        XCTAssertEqual(vm.currentIndex, 0, "Initial slide index should be 0")
    }

    func testSlidesCountIsThree() {
        let vm = GettingStartedViewModel()
        XCTAssertEqual(vm.slides.count, 3, "There should be 3 slides")
    }

    func testSlideContentIsCorrect() {
        let vm = GettingStartedViewModel()
        let first = vm.slides.first
        XCTAssertEqual(first?.title, "Easy Time Management")
    }
}
