class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var temp: [Int] = []
        for i in 0..<prices.count - 1 {
            temp.append(prices[i + 1] - prices[i])
        }
        var cur = 0
        var max = Int.min
        for i in 0..<temp.count {
            cur += temp[i]
            if cur > max {
                max = cur
            }
            if cur < 0 {
                cur = 0
            }
        }
        return max > 0 ? max : 0
    }
    
    func maxProfit_solution2(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var res = 0
        for p in prices {
            if p < minPrice {
                minPrice = p
            } else {
                res = max(p - minPrice, res)
            }
        }
        return res
    }
}
