from typing import List


class Solution:
    def nextPermutation(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        flag = False
        min_val = float("inf")
        min_idx = -1
        for i in range(n - 1, 0, -1):
            if nums[i - 1] < nums[i]:
                for j in range(i, n):
                    if nums[i - 1] < nums[j] < min_val:
                        min_val = nums[j]
                        min_idx = j
                nums[min_idx], nums[i - 1] = nums[i - 1], nums[min_idx]
                nums[i:] = sorted(nums[i:])
                flag = True
                break
        if not flag:
            nums.sort()
