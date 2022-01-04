//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by 송태환 on 2022/01/04.
//

import XCTest
@testable import base_calculator

class OperatorTest: XCTestCase {
    func testAndGate() {
        print("Testing AND Gate")
        XCTAssertEqual(and(true, true), true, "'and(true, true)' should be true")
        XCTAssertEqual(and(false, false), false, "'and(false, false)' should be false")
        XCTAssertEqual(and(true, false), false, "'and(true, false)' should be false")
        XCTAssertEqual(and(false, true), false, "'and(false, true)' should be false")
    }
    
    func testOrGate() {
        print("Testing OR Gate")
        XCTAssertEqual(or(true, true), true, "'or(true, true)' should be true")
        XCTAssertEqual(or(false, false), false, "'or(false, false)' should be true")
        XCTAssertEqual(or(true, false), true, "'or(true, false)' should be true")
        XCTAssertEqual(or(false, true), true, "'or(false, true)' should be true")
    }
    
    func testNotGate() {
        print("Testing NOT Gate")
        XCTAssertEqual(not(true), false, "'not(true)' should be false")
        XCTAssertEqual(not(false), true, "'not(false)' should be true")
    }
    
    func testNandGate() {
        print("Testing NAND Gate")
        XCTAssertEqual(nand(true, true), false, "'nand(true, true)' should be false")
        XCTAssertEqual(nand(false, false), true, "'nand(false, false)' should be true")
        XCTAssertEqual(nand(true, false), true, "'nand(true, false)' should be true")
        XCTAssertEqual(nand(false, true), true, "'nand(false, true)' should be true")
    }
    
    func testXorGate() {
        print("Testing XOR Gate")
        XCTAssertEqual(xor(true, true), false, "'nand(true, true)' should be false")
        XCTAssertEqual(xor(false, false), false, "'nand(false, false)' should be false")
        XCTAssertEqual(xor(true, false), true, "'nand(true, false)' should be true")
        XCTAssertEqual(xor(false, true), true, "'nand(false, true)' should be true")
    }

}
