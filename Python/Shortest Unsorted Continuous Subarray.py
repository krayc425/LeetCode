from typing import List


class Solution:
    def findUnsortedSubarray(self, nums: List[int]) -> int:
        n = len(nums)
        if n == 0:
            return 0
        l, r = 0, len(nums) - 1
        while l < n - 1 and nums[l] <= nums[l + 1]:
            l += 1
        if l == n - 1:
            return 0
        while r > 0 and nums[r] >= nums[r - 1]:
            r -= 1
        unsorted_max = float('-inf')
        unsorted_min = float('inf')
        for i in range(l, r + 1):
            unsorted_max = max(unsorted_max, nums[i])
            unsorted_min = min(unsorted_min, nums[i])
        while l > 0 and nums[l - 1] > unsorted_min:
            l -= 1
        while r < n - 1 and nums[r + 1] < unsorted_max:
            r += 1
        return r - l + 1
