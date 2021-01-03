from typing import List


class Solution:
    def wiggleSort(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        temp = sorted(nums)
        mid = (len(nums) + 1) // 2
        nums[0::2] = temp[:mid][::-1]
        nums[1::2] = temp[mid:][::-1]
