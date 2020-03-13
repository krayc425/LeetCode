class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard !cost.isEmpty else {
            return 0
        }
        var minCost: [Int] = Array(repeating: 0, count: cost.count)
        minCost[0] = cost[0]
        minCost[1] = cost[1]
        for i in 2..<cost.count {
            minCost[i] = min(minCost[i - 2], minCost[i - 1]) + cost[i]
            print(minCost)
        }
        return min(minCost[minCost.count - 1], minCost[minCost.count - 2])
    }
}

Solution().minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
