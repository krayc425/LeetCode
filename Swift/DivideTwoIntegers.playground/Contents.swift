class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard divisor != 0 else {
            return 0
        }
        let isNeg = (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var quotient = 0
        while dividend >= divisor {
            var temp = divisor
            var add = 1
            while (temp << 1) < dividend {
                temp <<= 1
                add <<= 1
            }
            quotient += add
            dividend -= temp
        }
        quotient *= (isNeg ? -1 : 1)
        return quotient > 2147483647 ? 2147483647 : quotient
    }
}

Solution().divide(Int.max, -1)
