from typing import List
from collections import deque


class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        n = len(nums)
        if n == 0 or k == 0:
            return []
        if k == 1:
            return nums
        d = deque()
        curr_max = nums[0]

        def clean_deque(i: int):
            if len(d) > 0 and d[0] <= i - k:
                d.popleft()
            while len(d) > 0 and nums[d[-1]] < nums[i]:
                d.pop()

        for i in range(k):
            clean_deque(i)
            d.append(i)
            curr_max = max(curr_max, nums[i])
        res = [curr_max]
        for i in range(k, n):
            clean_deque(i)
            d.append(i)
            res.append(nums[d[0]])
        return res
