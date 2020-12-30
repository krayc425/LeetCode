from typing import List


class Solution:
    def fourSumCount(self, A: List[int], B: List[int], C: List[int], D: List[int]) -> int:
        map = {}
        for a in A:
            for b in B:
                map[a + b] = map.get(a + b, 0) + 1
        res = 0
        for c in C:
            for d in D:
                res += map.get(-(c + d), 0)
        return res
