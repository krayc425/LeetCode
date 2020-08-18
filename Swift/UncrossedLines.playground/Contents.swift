class Solution {
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        guard !A.isEmpty && !B.isEmpty else {
            return 0
        }
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: B.count + 1), count: A.count + 1)
        for i in 0..<A.count {
            for j in 0..<B.count {
                if A[i] == B[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i + 1][j], dp[i][j + 1])
                }
            }
        }
        return dp[A.count][B.count]
    }
}

Solution().maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1])
