from typing import List


class Solution:
    def minSubArrayLen(self, s: int, nums: List[int]) -> int:
        res = float('inf')
        sum = 0
        l = 0
        for r, n in enumerate(nums):
            sum += n
            while sum >= s:
                res = min(res, r - l + 1)
                sum -= nums[l]
                l += 1
        return res if res != float('inf') else 0
