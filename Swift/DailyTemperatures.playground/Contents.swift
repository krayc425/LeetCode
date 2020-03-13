class Solution {
    func dailyTemperatures_tle(_ T: [Int]) -> [Int] {
        var res: [Int] = []
        for i in 0..<T.count - 1 {
            var count = 1
            var j = i + 1
            var hasHigher = false
            while j < T.count {
                if T[j] <= T[i] {
                    count += 1
                } else {
                    hasHigher = true
                    break
                }
                j += 1
            }
            res.append(hasHigher ? count : 0)
        }
        return res + [0]
    }
    
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var res: [Int] = []
        var tmp: [Int] = []
        for i in (0..<T.count).reversed() {
            while !tmp.isEmpty && T[i] >= T[tmp.last!] {
                tmp.removeLast()
            }
            res.append(tmp.isEmpty ? 0 : tmp.last! - i)
            tmp.append(i)
        }
        return res.reversed()
    }
}

Solution().dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
