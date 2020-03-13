class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        var dp: [Int] = Array(repeating: 1, count: s.count)
        let sarr = Array(s)
        let scount = sarr.count
        for i in (0..<scount).reversed() {
            var len = 0
            for j in (i + 1)..<scount {
                let tmp = dp[j]
                if sarr[i] == sarr[j] {
                    dp[j] = len + 2
                }
                len = max(len, tmp)
            }
        }
        return dp.max()!
    }
}

Solution().longestPalindromeSubseq("bbbbab")
