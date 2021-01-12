from typing import List
from collections import defaultdict


class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        map = defaultdict(int)
        map[0] = -1
        sum = 0
        res = 0
        for idx, n in enumerate(nums):
            sum += n
            if sum - k in map:
                res = max(res, idx - map[sum - k])
            if sum not in map:
                map[sum] = idx
        return res
