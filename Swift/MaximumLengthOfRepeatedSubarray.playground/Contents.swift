class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        guard !A.isEmpty && !B.isEmpty else {
            return 0
        }
        var res: Int = 0
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: A.count + 1), count: B.count + 1)
        for i in (0..<A.count).reversed() {
            for j in (0..<B.count).reversed() {
                if A[i] == B[j] {
                    dp[i][j] = dp[i + 1][j + 1] + 1
                    res = max(res, dp[i][j])
                }
            }
        }
        return res
    }
}

/**
 Since a common subarray of A and B must start at some A[i] and B[j], let dp[i][j] be the longest common prefix of A[i:] and B[j:]. Whenever A[i] == B[j], we know dp[i][j] = dp[i+1][j+1] + 1. Also, the answer is max(dp[i][j]) over all i, j.

 We can perform bottom-up dynamic programming to find the answer based on this recurrence. Our loop invariant is that the answer is already calculated correctly and stored in dp for any larger i, j.
 */

Solution().findLength([1,2,3,2,1], [3,2,1,4,7])
Solution().findLength([0,0,0,0,0], [0,0,0,0,0])
Solution().findLength([1,0,0,0,0], [0,0,0,0,1])
