//
//  operators.swift
//  base-calculator
//
//  Created by 송태환 on 2022/01/03.
//

import Foundation

func and(_ bitA: Bool, _ bitB: Bool) -> Bool {
   return bitA && bitB
}

func or(_ bitA: Bool, _ bitB: Bool) -> Bool {
    return bitA || bitB
}

func not(_ bit: Bool) -> Bool {
    return !bit
}

func nand(_ bitA: Bool, _ bitB: Bool) -> Bool {
    return !and(bitA, bitB)
}

func xor(_ bitA: Bool, _ bitB: Bool) -> Bool {
    return and(nand(bitA, bitB), or(bitA,bitB))
}
