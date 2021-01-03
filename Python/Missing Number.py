from typing import List


class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        sum = 0
        for n in nums:
            sum += n
        l = len(nums)
        return l * (l + 1) // 2 - sum
