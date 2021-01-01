from typing import List


class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        if len(nums) == 0:
            return 0
        res = float("-inf")
        curr_max = 1
        curr_min = 1
        for n in nums:
            new_max = max(curr_max * n, curr_min * n, n)
            new_min = min(curr_max * n, curr_min * n, n)
            res = max(res, new_max)
            curr_max = new_max
            curr_min = new_min
        return res
