//
//  BaseCalculatorTest.swift
//  BaseCalculatorTest
//
//  Created by 송태환 on 2022/01/04.
//

import XCTest
@testable import base_calculator

class BaseCalculatorTest: XCTestCase {
    func testDecimalToBinaryConversion() {
        print("Testing convertDecimalToBinary")
        XCTAssertEqual(convertDecimalToBinary(12), [false, false, true, true], "12 should be converted into 1100")
        XCTAssertEqual(convertDecimalToBinary(10), [false, true, false, true], "10 should be converted into 1010")
        XCTAssertEqual(convertDecimalToBinary(5), [true, false, true], "5 should be converted into 0101")
        XCTAssertEqual(convertDecimalToBinary(173), [true, false, true, true, false, true , false, true], "173 should be converted into 10101101")
    }
    
    func testBianryToDecimalConversion() {
        print("Testing convertBinaryToDecimal")
        XCTAssertEqual(convertBinaryToDecimal([false, true, true, true]), 14, "1110 should be converted into 14")
        XCTAssertEqual(convertBinaryToDecimal([false, false, true, true]), 12, "1100 should be converted into 12")
        XCTAssertEqual(convertBinaryToDecimal([false, false, false, true]), 8, "1000 should be converted into 8")
        XCTAssertEqual(convertBinaryToDecimal([true, false, true, false]), 5, "0101 should be converted into 5")
    }
    
    func testDecimalToHexadecimalConversion() {
        print("Testing convertDecimalToHexadecimal")
        XCTAssertEqual(convertDecimalToHexadecimal(8, 2), ["A"], "10 should be converted into 'A'")
        XCTAssertEqual(convertDecimalToHexadecimal(10, 173), ["7", "B"], "183 should be converted into 'B7'")
        XCTAssertEqual(convertDecimalToHexadecimal(1000, 234), ["2", "D", "4"], "1234 should be converted into '4D2'")
    }
}
