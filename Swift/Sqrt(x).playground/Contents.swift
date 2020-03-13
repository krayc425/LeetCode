class Solution {
    func mySqrt(_ x: Int) -> Int {
        var k = 0
        while k * k <= x {
            k += 1
        }
        return k - 1
    }
}

Solution().mySqrt(100)
