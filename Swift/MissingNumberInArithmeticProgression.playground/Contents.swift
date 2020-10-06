class Solution {
    func missingNumber(_ arr: [Int]) -> Int {
        var minDeltaAbs = Int.max
        var isNeg = false
        for i in 0..<arr.count - 1 {
            isNeg = arr[i + 1] < arr[i]
            minDeltaAbs = min(minDeltaAbs, abs(arr[i + 1] - arr[i]))
        }
        if minDeltaAbs == 0 {
            return arr.first!
        }
        var first = arr.first!
        for i in 1..<arr.count {
            first += minDeltaAbs * (isNeg ? -1 : 1)
            if arr[i] != first {
                return first
            }
        }
        return -1
    }
}

Solution().missingNumber([15,13,12])
Solution().missingNumber([5,7,11,13])
Solution().missingNumber([0,0,0,0,0,0])
