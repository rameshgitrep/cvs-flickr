//
//  DateParsingTests.swift
//  FlickrTests
//
//  Created by Ramesh Maddali on 7/1/24.
//

import XCTest
@testable import Flickr

class DateParsingTests: XCTestCase {
    
    func testDateParsing() {
        let viewModel = ImageDetailViewModel()
        // Given
        let dateString = "2024-06-27T10:17:53Z"
        let expectedDateString = "Jun 27, 2024"
        
        // When
        let formattedDate = viewModel.formatDate(dateString: dateString)
        
        // Then
        XCTAssertEqual(formattedDate, expectedDateString)
    }
}
