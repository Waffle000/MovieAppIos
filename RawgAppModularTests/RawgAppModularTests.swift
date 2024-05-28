//
//  RawgAppModularTests.swift
//  RawgAppModularTests
//
//  Created by Enrico Maricar on 29/05/24.
//

import XCTest
import Core

final class RawgAppModularTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRemoveHtml() throws {
        let inputString = "<p>This is <b>bold</b> text.</p>"
        let expectedResult = "This is bold text."
        let result = RemovedHtml(from: inputString)
        XCTAssertEqual(result, expectedResult, "Hasil penghapusan tag HTML harus sesuai dengan yang diharapkan")
    }

    func testRemoveHtmlEmptyInput() throws {
        let inputString = ""
        let result = RemovedHtml(from: inputString)
        XCTAssertEqual(result, "", "Hasil harus tetap kosong saat input string kosong")
    }

    func testRemoveHtmlNoTags() throws {
        let inputString = "This is plain text."
        let result = RemovedHtml(from: inputString)
        XCTAssertEqual(result, inputString, "Hasil harus sama dengan string input jika tidak ada tag HTML")
    }

}
