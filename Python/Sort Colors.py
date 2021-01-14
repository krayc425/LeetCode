from typing import List


class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        r = 0
        g = 1
        b = len(nums) - 1
        while g <= b:
            if nums[g] == 0:
                nums[g], nums[r] = nums[r], nums[g]
                r += 1
                g += 1
            elif nums[g] == 2:
                nums[g], nums[b] = nums[b], nums[g]
                b -= 1
            else:
                g += 1
