from typing import List


class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return 0
        dp = [0] * n
        dp[0] = 1
        res = 1
        for i in range(1, n):
            temp_res = 0
            for j in range(i):
                if nums[j] < nums[i]:
                    temp_res = max(temp_res, dp[j])
            dp[i] = temp_res + 1
            res = max(res, dp[i])
        return res
