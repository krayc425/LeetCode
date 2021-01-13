from typing import List
from collections import deque


class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        n = len(nums)
        if n == 0 or k == 0:
            return []
        if k == 1:
            return nums
        # all nums[i] (i in deque) are in **decreasing** order
        # so d[0] will always be the max element within the range
        d = deque()
        curr_max = nums[0]

        def clean_deque(i: int):
            # remove indexes of elements not in the sliding window
            if len(d) > 0 and d[0] <= i - k:
                d.popleft()
            # remove from deque indexes of all elements
            # which are smaller than current element nums[i]
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
