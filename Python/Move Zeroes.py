from typing import List


class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        i = 0
        non_zero_i = 0
        while i < n:
            if nums[i] != 0:
                nums[non_zero_i] = nums[i]
                non_zero_i += 1
            i += 1
        for i in range(non_zero_i, n):
            nums[i] = 0
