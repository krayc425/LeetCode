from typing import List


class Solution:
    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:
        if k <= 1:
            return 0
        prod = 1
        l = 0
        res = 0
        for r, num in enumerate(nums):
            prod *= num
            while prod >= k:
                prod /= nums[l]
                l += 1
            res += (r - l + 1)
        return res
