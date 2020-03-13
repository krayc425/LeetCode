import UIKit

func calculateFloorSqrt(of x: Double) -> Int {
    var result      : Double = x
    var lastResult  : Double = 0.0
    while result != lastResult {
        lastResult = result
        result = floor((result + floor(x / result)) / 2.0)
    }
    return Int(result)
}

print(calculateFloorSqrt(of: 9183741.1293821))
