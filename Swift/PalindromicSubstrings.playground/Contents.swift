class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let count = s.count
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)
        let chars = Array(s)
        for i in (0..<count).reversed() {
            for j in (i..<count).reversed() {
                if i == j {
                    dp[i][j] = true
                } else if j == i + 1 && chars[i] == chars[j] {
                    dp[i][j] = true
                } else if dp[i + 1][j - 1] && chars[i] == chars[j] {
                    dp[i][j] = true
                }
            }
        }
        return dp.flatMap { $0 }.filter { $0 }.count
    }
}

Solution().countSubstrings("aaa")
