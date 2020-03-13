class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        var res: [Int] = [0] + Array(repeating: amount + 1, count: amount)
        for i in 1...amount {
            for coin in coins where coin <= i {
                res[i] = min(res[i], res[i - coin] + 1)
            }
        }
        let last = res.last!
        return last > amount ? -1 : last
    }
}

Solution().coinChange([1, 2, 5], 11)
