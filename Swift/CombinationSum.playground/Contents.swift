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
    
    func combinationSum_dp(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var dp: [[[Int]]] = []
        for i in 1...target {
            var temp: [[Int]] = []
            for candidate in candidates.sorted() {
                if candidate > i {
                    break
                }
                if candidate == i {
                    temp.append([candidate])
                    break
                }
                for var arr in dp[i - candidate - 1] {
                    if candidate > arr.first! {
                        continue
                    } else {
                        arr.insert(candidate, at: 0)
                        temp.append(arr)
                    }
                }
            }
            dp.append(temp)
        }
        return dp[target - 1]
    }
}

Solution().combinationSum_dp([2,3,5], 8)
