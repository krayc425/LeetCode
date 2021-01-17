from typing import List


class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        non_zero_i = 0
        for i in range(n):
            if nums[i] != 0:
                nums[non_zero_i] = nums[i]
                non_zero_i += 1
        for i in range(non_zero_i, n):
            nums[i] = 0
