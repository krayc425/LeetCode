class Solution {
    func maxA(_ N: Int) -> Int {
        var dp = Array(repeating: 0, count: N + 1)
        for i in 1...N {
            dp[i] = i
            if i < 4 {
                continue
            }
            for j in 1...(i - 3) {
                dp[i] = max(dp[i], dp[j] * (i - j - 1))
                                // dp[j] + (i - j - 2) * dp[j]
                                //   ^          ^
                                // Type    Paste, minus 2 for 1 select + 1 copy
            }
        }
        return dp[N]
    }
}
