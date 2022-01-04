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

func fullAdder(_ bitA: Bool, _ bitB: Bool, _ carryIn: Bool) -> [Bool] {
    let halfResult = halfAdder(bitA, bitB)
    let sum1 = halfResult.last!
    let restResult = halfAdder(carryIn, sum1)
    let sum = restResult.last!
    let carryOut = or(restResult.first!, halfResult.first!)
    
    return [carryOut, sum]
}

func byteAdder(_ byteA: [Bool], _ byteB: [Bool]) -> [Bool] {
    var binary = [Bool]()
    var carry = false
    
    for i in 0..<max(byteA.count, byteB.count) {
        // LSB -> 배열의 길이가 다를 때 인덱스 접근에 주의해야함(런타임 에러)
        let bitA = byteA.count > i ? byteA[i] : false
        let bitB = byteB.count > i ? byteB[i] : false
        let result = fullAdder(bitA, bitB, carry)
        let sum = result.last!

        carry = result.first!
        binary.append(sum)
    }

    binary.append(carry)

    return binary
}
