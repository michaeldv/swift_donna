//
//  main.swift
//  Swift Donna chess engine.
//
//  Created by Michael Dvorkin on 10/25/14.
//  Copyright (c) 2014 Michael Dvorkin. All rights reserved.
//

import Donna

let zero: Bitmask = 0
let nonzero: Bitmask = 42

println("Zero: \(zero) empty \(zero.empty) any \(zero.any) on(2) \(zero.on(1)) off(2) \(zero.off(1))")
println("Non Zero: \(nonzero) empty \(nonzero.empty) any \(nonzero.any) on(1) \(nonzero.on(1)) off(1) \(nonzero.off(1))")
