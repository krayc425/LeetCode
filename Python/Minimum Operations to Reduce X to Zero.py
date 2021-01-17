from typing import List


class Solution:
    def minOperations(self, nums: List[int], x: int) -> int:
        total = sum(nums)
        n = len(nums)
        l = 0
        curr = 0
        res = -1
        for r in range(n):
            curr += nums[r]
            while curr > total - x and l <= r:
                curr -= nums[l]
                l += 1
            if curr == total - x:
                res = max(res, r - l + 1)
        return n - res if res != -1 else -1
