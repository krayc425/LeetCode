class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var temp: [Int] = []
        for i in 0..<prices.count - 1 {
            temp.append(prices[i + 1] - prices[i])
        }
        return temp.filter { $0 > 0 }.reduce(0, +)
    }
}

print(Solution().maxProfit([7,1,5,3,6,4]))
