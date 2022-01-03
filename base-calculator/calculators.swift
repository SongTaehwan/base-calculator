//
//  calculators.swift
//  base-calculator
//
//  Created by 송태환 on 2022/01/03.
//

import Foundation

func halfAdder(_ bitA: Bool, _ bitB: Bool) -> [Bool] {
    func sum(_ bitA: Bool, _ bitB: Bool) -> Bool {
        return xor(bitA, bitB)
    }
    
    func carry(_ bitA: Bool, _ bitB: Bool) -> Bool {
        return and(bitA, bitB)
    }
    
    return [carry(bitA, bitB), sum(bitA, bitB)]
}

func fullAdder(_ bitA: Bool, _ bitB: Bool, _ cIn: Bool) -> [Bool] {
    let halfResult = halfAdder(bitA, bitB)
    let sum1 = halfResult.last!
    let restResult = halfAdder(cIn, sum1)
    let sum = restResult.last!
    let cOut = or(restResult.first!, halfResult.first!)
    
    return [cOut, sum]
}

func byteAdder(_ byteA: [Bool], _ byteB: [Bool]) -> [Bool] {
    guard byteA.count == byteB.count else { return [] }
    
    var binary = [Bool]()
    var carry = false
    
    for i in 0..<byteB.count {
        let bitA = byteA[i]
        let bitB = byteB[i]
        let result = fullAdder(bitA, bitB, carry)
        let sum = result.last!

        carry = result.first!
        binary.append(sum)
    }

    binary.append(carry)

    return binary
}
