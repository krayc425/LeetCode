class Solution {
    func longestArithSeqLength(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return A.count
        }
        let N = A.count
        var dp: [Int: [Int: Int]] = [:]
        var res = 2
        for i in 0..<N {
            for j in 0..<i {
                let diff = A[i] - A[j]
                if dp[diff] == nil {
                    dp[diff] = [i : 2]
                }
                dp[diff]![i] = max(
                    (dp[diff]![i, default: 2]),
                    (dp[diff]![j, default: 0]) + 1)
                res = max(res, dp[diff]![i]!)
            }
        }
        return res
    }
}

Solution().longestArithSeqLength([20,1,15,3,10,5,8])
