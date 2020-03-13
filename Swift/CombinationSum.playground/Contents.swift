class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        process(&result, &temp, candidates, 0, target)
        return result
    }
    
    func process(_ result: inout [[Int]], _ temp: inout [Int], _ candidates: [Int], _ index: Int, _ target: Int) {
        if target < 0 {
            return
        }
        if target == 0 {
            // 找到一个符合的结果，返回
            result.append(temp)
            return
        }
        // 从前往后开始循环
        for i in index..<candidates.count {
            temp.append(candidates[i])
            process(&result, &temp, candidates, i, target - candidates[i])
            temp.removeLast()
        }
    }
}

Solution().combinationSum([6,5,4,3,2], 8)
