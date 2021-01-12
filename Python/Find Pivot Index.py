from typing import List


class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return -1
        prefix = [0]
        for i in range(1, n):
            prefix.append(prefix[-1] + nums[i - 1])
        sum = prefix[-1] + nums[-1]
        for i, num in enumerate(nums):
            sum -= num
            if prefix[i] == sum:
                return i
        return -1
