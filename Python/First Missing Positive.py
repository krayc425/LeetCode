from typing import List


class Solution:
    def firstMissingPositive(self, nums: List[int]) -> int:
        if len(nums) == 0:
            return 1
        if 1 not in nums:
            return 1
        i = 0
        n = len(nums)
        while i < n:
            idx = nums[i] - 1
            if 0 <= idx < n and nums[idx] != nums[i]:
                nums[i], nums[idx] = nums[idx], nums[i]
            else:
                i += 1
        for i in range(n):
            if nums[i] != i + 1:
                return i + 1
        return n + 1
