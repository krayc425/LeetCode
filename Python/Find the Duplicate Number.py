from typing import List


class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        n = len(nums)
        arr = [0] * n
        for num in nums:
            if arr[num - 1] != 0:
                return num
            arr[num - 1] = num
        return 0
