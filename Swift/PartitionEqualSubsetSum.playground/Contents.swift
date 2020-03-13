class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        let target = sum >> 1
        if sum % 2 == 1 {
            return false
        }
        // dp[i]: Whether we can get some numbers from array which sum up to i
        var dp: [Bool] = [true] + Array(repeating: false, count: target)
        for num in nums where num < target {
            for i in (num...target).reversed() {
                dp[i] = dp[i] || dp[i - num]
            }
        }
        return dp.last!
    }
}

Solution().canPartition([1,2,5])
