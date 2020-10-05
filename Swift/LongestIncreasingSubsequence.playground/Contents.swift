class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        var res = 1
        for i in 1..<nums.count {
            var maxVal = 0
            for j in 0..<i {
                if nums[i] > nums[j] {
                    maxVal = max(maxVal, dp[j])
                }
            }
            dp[i] = maxVal + 1
            res = max(res, dp[i])
        }
        return res
    }
}
