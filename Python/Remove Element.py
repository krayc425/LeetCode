from typing import List


class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        removed = 0
        n = len(nums)
        start, end = 0, n - 1
        while start <= end:
            if nums[start] == val:
                removed += 1
                nums[start], nums[end] = nums[end], nums[start]
                end -= 1
            else:
                start += 1
        nums = nums[:removed]
        return n - removed
