from typing import List


class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return 0
        i, count = 0, 1
        for j in range(1, n):
            if nums[j] == nums[j - 1]:
                count += 1
            else:
                count = 1
            if count <= 2:
                i += 1
                nums[i] = nums[j]
        return i + 1
