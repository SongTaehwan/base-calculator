//
//  BinaryCalculatorTest.swift
//  BinaryCalculatorTest
//
//  Created by 송태환 on 2022/01/04.
//

import XCTest
@testable import base_calculator

class BinaryCalculatorTest: XCTestCase {
    func testHalfAdder() {
        print("Testing half-adder")
        XCTAssertEqual(halfAdder(true, true), [true, false], "'halfAdder(true, true)' should be [true, false]")
        XCTAssertEqual(halfAdder(false, false), [false, false], "'halfAdder(false, false)' should be [false, false]")
        XCTAssertEqual(halfAdder(true, false), [false, true], "'halfAdder(true, false)' should be [false, true]")
        XCTAssertEqual(halfAdder(false, true), [false, true], "'halfAdder(false, true)' should be [false, true]")
    }
    
    func testFullAdder() {
        print("Testing full-adder")
        XCTAssertEqual(fullAdder(true, true, false), [true, false], "'halfAdder(true, true)' should be [true, false]")
        XCTAssertEqual(fullAdder(false, false, false), [false, false], "'halfAdder(false, false)' should be [false, false]")
        XCTAssertEqual(fullAdder(true, false, false), [false, true], "'halfAdder(true, false)' should be [false, true]")
        XCTAssertEqual(fullAdder(false, true, false), [false, true], "'halfAdder(false, true)' should be [false, true]")
    }
    
    func testByteAdderWith1ByteInputs() {
        print("Testing byte-adder with 1 byte inputs")
        XCTAssertEqual(
            byteAdder(
                [true, true, false, true, true, false, true, false],
                [true, false, true, true, false, false, true, true]
            ),
            [false, false, false, true, false, true, false, false, true],
            "'01011011 + 11001101' should be '0100101000'"
        )
        
        XCTAssertEqual(
            byteAdder(
                [true, true, false, false, true, false, true, false],
                [true, true, false, true, true, false, false, true]
            ),
            [false, true, true, true, false, true, true, true, false],
            "'01010011 + 10011011' should be '011101110'"
        )
    }
    
    func testByteAdderWith4BitsInputs() {
        print("Testing byte-adder with 4 bits inputs")
        XCTAssertEqual(
            byteAdder(
                [false, false, true, true],
                [true, false, true, false]
            ),
            [true, false, false, false, true],
            "'1100 + 01010' should be '010001'"
        )
        
        print("Testing byte-adder with unbalanced bits inputs")
        XCTAssertEqual(
            byteAdder(
                [false, false, true, true],
                [true, false, true]
            ),
            [true, false, false, false, true],
            "'1100 + 101' should be '0100001'"
        )
    }
    
    func testByteAdderWith16BitsInputs() {
        print("Testing byte-adder with 16 bits inputs")
        XCTAssertEqual(
            byteAdder(
                [false, false, false, false, true, false, true, false, true ,true, true, true, false, false, false, true],
                [true, true, false, false, false, false, true, true, false, false, false, false, false, true, false, true]
            ),
            [true, true, false, false, true, false, false, false, false, false, false, false, true, true, false, false, true],
            "'1000111101010000 + 1010000011000011' should be '010011000000010011'"
        )
        
    }
}
