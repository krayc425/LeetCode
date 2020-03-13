class Solution {
    func reverse(_ x: Int) -> Int {
        var result = 0
        let isNeg = x < 0
        var x = abs(x)
        while x > 0 {
            result *= 10
            result += x % 10
            if result > Int32.max {
                return 0
            }
            x /= 10
        }
        return result * (isNeg ? -1 : 1)
    }
}
