from typing import List


class Solution:
    def rob(self, nums: List[int]) -> int:
        if len(nums) <= 1:
            return 0 if len(nums) == 0 else nums[0]
        dp = nums[:]
        dp[1] = max(dp[0], dp[1])
        for i in range(2, len(dp)):
            dp[i] = max(dp[i - 2] + dp[i], dp[i - 1])
        return dp[-1]
