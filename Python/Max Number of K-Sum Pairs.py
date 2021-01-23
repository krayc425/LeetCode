from typing import List
from collections import defaultdict


class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        res = 0
        map = defaultdict(int)
        for n in nums:
            if map[k - n] > 0:
                map[k - n] -= 1
                res += 1
            else:
                map[n] += 1
        return res
