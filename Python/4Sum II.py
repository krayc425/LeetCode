from typing import List
from collections import defaultdict


class Solution:
    def fourSumCount(self, A: List[int], B: List[int], C: List[int], D: List[int]) -> int:
        map = defaultdict(int)
        for a in A:
            for b in B:
                map[a + b] += 1
        res = 0
        for c in C:
            for d in D:
                res += map[-(c + d)]
        return res
