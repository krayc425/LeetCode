//: Playground - noun: a place where people can play

let testArray: [Double] = [-2.5,-3,4,0,3,0.5,8,-1]

func longestConsecutiveProduct(_ arr: [Double]) -> Double {
    let n = arr.count
    guard n > 1 else {
        return arr.first!
    }
    
    var max = arr[0]
    var min = arr[0]
    var maxResult = arr[0]
    
    for i in 1..<n {
        let currentMax = max * arr[i]
        let currentMin = min * arr[i]
        max = Double.maximum(Double.maximum(currentMax, currentMin), arr[i])
        min = Double.minimum(Double.minimum(currentMax, currentMin), arr[i])
        maxResult = Double.maximum(maxResult, max)
    }
    
    return maxResult
}

longestConsecutiveProduct(testArray)
