from typing import List
from collections import deque


class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        n = len(nums)
        if n * k == 0:
            return []
        if k == 1:
            return nums
        # all nums[i] (i in deque) are in **decreasing** order
        # so d[0] will always be the max element within the range
        d = deque()

        res = [nums[0]]
        for i in range(n):
            # remove indexes of elements not in the sliding window
            if len(d) > 0 and d[0] <= i - k:
                d.popleft()
            # remove from deque indexes of all elements
            # which are smaller than current element nums[i]
            while len(d) > 0 and nums[d[-1]] < nums[i]:
                d.pop()
            d.append(i)
            if i < k:
                res[0] = max(res[0], nums[i])
            else:
                res.append(nums[d[0]])
        return res
