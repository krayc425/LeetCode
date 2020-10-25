class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: Set<[Int]> = Set()  // 不能重复的，用Set
        var temp: [Int] = []
        process(&result, &temp, candidates.sorted(), 0, target)
        return Array(result)
    }
    
    func process(_ result: inout Set<[Int]>, _ temp: inout [Int], _ candidates: [Int], _ index: Int, _ target: Int) {
        if target < 0 {
            return
        }
        if target == 0 {
            // 找到一个符合的结果，返回
            result.insert(temp)
            return
        }
        // 从前往后开始循环
        for i in index..<candidates.count {
            if i > index && candidates[i - 1] == candidates[i] {
                continue
            }
            temp.append(candidates[i]) // 与1不同的是 这里是i+1
            process(&result, &temp, candidates, i + 1, target - candidates[i])
            temp.removeLast()
        }
    }
}

Solution().combinationSum2([8], 8)
