class Solution {
    func countOrders(_ n: Int) -> Int {
        var res = 1
        for i in 1...n {
            res *= i * (2 * i - 1)
            res %= 1_000_000_007
        }
        return res
    }
}

Solution().countOrders(3)
