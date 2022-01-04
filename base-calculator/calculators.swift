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

func convertDecimalToBinary(_ number: Int) -> [Bool] {
    var number = number
    var binary = [Bool]()
    
    while number > 0 {
        let reminder = number % 2
        binary.append(reminder == 1)
        number /= 2
    }
    
    return binary
}

func convertBinaryToDecimal(_ binary: [Bool]) -> Int {
    var power = 1
    var result = 0
    
    for bit in binary {
        result += (bit ? 1 : 0) * power
        power *= 2
    }
    
    return result
}

func convertBinaryToHexadecimal(_ binary: [Bool]) -> [String] {
    var binaryList = binary
    let short = 4 - (binary.count % 4)
    
    for _ in 0..<short {
        binaryList.append(false)
    }
    
    var sum = 0
    var power = 1
    var intermidiates = [Int]()
    
    for (i, bit) in binaryList.enumerated() {
        sum += (bit ? 1 : 0) * power
        power *= 2
        
        if (i + 1) % 4 == 0 && sum != 0 {
            intermidiates.append(sum)
            sum = 0
            power = 1
        }
    }

    return intermidiates.map { getHexCharacter($0) }
}

func convertDecimalToHexadecimal(_ num1: Int, _ num2: Int) -> [String] {
    let binarySum = byteAdder(
        convertDecimalToBinary(num1),
        convertDecimalToBinary(num2)
    )
    
    return convertBinaryToHexadecimal(binarySum)
}

func getHexCharacter(_ num: Int) -> String {
    switch num {
    case 10...:
        return String(UnicodeScalar(55 + num)!)
    default:
        return String(num)
    }
}
