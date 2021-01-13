from typing import List


class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        r = 0
        b = len(nums) - 1
        curr = 1
        while curr <= b:
            if nums[curr] == 0:
                nums[curr], nums[r] = nums[r], nums[curr]
                r += 1
                curr += 1
            elif nums[curr] == 2:
                nums[curr], nums[b] = nums[b], nums[curr]
                b -= 1
            else:
                curr += 1
