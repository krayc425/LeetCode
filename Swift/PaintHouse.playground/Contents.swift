class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        var red     = [0]
        var green   = [0]
        var blue    = [0]
        
        for cost in costs {
            let newRed      = cost[0] + min(blue.last!, green.last!)
            let newGreen    = cost[1] + min(red.last!, blue.last!)
            let newBlue     = cost[2] + min(red.last!, green.last!)
            red.append(newRed)
            green.append(newGreen)
            blue.append(newBlue)
        }
        
        return [red.last!, green.last!, blue.last!].min()!
    }
}
