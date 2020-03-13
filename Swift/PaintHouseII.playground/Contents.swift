class Solution {
    func minCostII(_ costs: [[Int]]) -> Int {
        guard !costs.isEmpty else {
            return 0
        }
        let colors = costs[0].count
        guard colors > 1 else {
            return costs.map { $0[0] }.min()!
        }
        var previousCost = Array(repeating: 0, count: colors)
        
        for cost in costs {
            var currentCost = Array(repeating: 0, count: colors)
            for color in 0..<colors {
                let sameColor = previousCost.remove(at: color)
                currentCost[color] = cost[color] + previousCost.min()!
                previousCost.insert(sameColor, at: color)
            }
            previousCost = currentCost
        }
        
        return previousCost.min()!
    }
}

Solution().minCostII([[1,5,3],[2,9,4]])
