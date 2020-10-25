class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = [1, 1] + [Int](repeating: 0, count: n - 1)
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp.last!
    }
    
    func numTrees_recursive(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        var visited: [Int: Int] = [:]
        return helper(1, n, &visited)
    }
    
    func helper(_ start: Int, _ end: Int, _ visited: inout [Int: Int]) -> Int {
        if start >= end {
            return 1
        }
        if let val = visited[end - start] {
            return val
        }
        var sum = 0
        for i in start...end {
            sum += helper(start, i - 1, &visited) * helper(i + 1, end, &visited)
        }
        visited[end - start] = sum
        return sum
    }
}
