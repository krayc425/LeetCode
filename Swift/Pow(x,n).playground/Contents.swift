class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        let t = myPow(x, n / 2)
        if n % 2 == 0 {
            return t * t
        } else {
            if n > 0 {
                return t * t * x
            } else {
                return t * t / x
            }
        }
    }
}

Solution().myPow(12, -13)
