import Foundation

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        var l = 0
        var r = Int(sqrt(Double(c)))
        while l <= r {
            let s = l * l + r * r
            if s == c {
                return true
            } else if s < c {
                l += 1
            } else {
                r -= 1
            }
        }
        return false
    }
}

Solution().judgeSquareSum(6)
