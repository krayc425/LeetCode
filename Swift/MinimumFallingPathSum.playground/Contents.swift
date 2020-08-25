class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        guard var dp = A.first else {
            return 0
        }
        for i in 1..<A.count {
            var tempDp = Array(repeating: Int.max, count: dp.count)
            for j in 0..<dp.count {
                for k in max(0, j - 1)...min(dp.count - 1, j + 1) {
                    tempDp[j] = min(tempDp[j], dp[k])
                }
                tempDp[j] += A[i][j]
            }
            dp = tempDp
        }
        return dp.min()!
    }
    
    func minFallingPathSum_TLE(_ A: [[Int]]) -> Int {
        guard let first = A.first else {
            return 0
        }
        var res = Int.max
        var visited: [[Int]] = []
        for i in 0..<first.count {
            var path: [Int] = [first[i]]
            process(&res, &visited, &path, 1, A, i)
        }
        return res
    }
    
    func process(_ res: inout Int, _ visited: inout [[Int]], _ path: inout [Int],
                 _ depth: Int, _ A: [[Int]], _ index: Int) {
        guard !visited.contains(path) else {
            return
        }
        visited.append(path)
        if path.count == A.count {
            res = min(res, path.reduce(0, +))
            return
        }
        let currLevel = A[depth]
        for i in max(0, index - 1)...min(currLevel.count - 1, index + 1) {
            path.append(currLevel[i])
            process(&res, &visited, &path, depth + 1, A, i)
            path.removeLast()
        }
    }
}

Solution().minFallingPathSum([[1,2,3],[4,5,6],[7,8,9]])
Solution().minFallingPathSum([[63,70,79,18],[90,16,-10,32],[100,84,59,-84],[23,-3,26,69]])
