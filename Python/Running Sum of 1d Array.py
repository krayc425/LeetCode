from typing import List


class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        n = len(nums)
        if n == 0:
            return []
        res = [nums[0]]
        for i in range(1, n):
            res.append(res[-1] + nums[i])
        return res
