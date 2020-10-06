class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var leftProfit: [Int] = Array(repeating: 0, count: prices.count)
        var rightProfit: [Int] = Array(repeating: 0, count: prices.count + 1)
        var leftMin = prices.first!
        var rightMax = prices.last!
        for l in 1..<prices.count {
            leftProfit[l] = max(leftProfit[l - 1], prices[l] - leftMin)
            leftMin = min(leftMin, prices[l])
            let r = prices.count - 1 - l
            rightProfit[r] = max(rightProfit[r + 1], rightMax - prices[r])
            rightMax = max(rightMax, prices[r])
        }
        var maxProfit = 0
        for i in 0..<prices.count {
            maxProfit = max(maxProfit, leftProfit[i] + rightProfit[i + 1])
        }
        return maxProfit
    }
}
