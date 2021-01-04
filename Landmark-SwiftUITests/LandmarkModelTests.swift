//
//  LandmarkModelTests.swift
//  Landmark-SwiftUITests
//
//  Created by Aleksander Wędrychowski on 04/01/2021.
//

import XCTest
@testable import Landmark_SwiftUI

class LandmarkModelTests: XCTestCase {

    func testLondmarksDecoding() throws {
        let landmarks: [Landmark] = try DataProvider.load(from: "landmarkData.json")
        XCTAssertTrue(landmarks.isEmpty == false)
    }

}
