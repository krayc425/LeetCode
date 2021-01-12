from typing import List
from collections import defaultdict


class Solution:
    def numSubarraysWithSum(self, A: List[int], S: int) -> int:
        map = defaultdict(int)
        map[0] = 1
        sum = 0
        res = 0
        for i, n in enumerate(A):
            sum += n
            if sum - S in map:
                res += map[sum - S]
            map[sum] += 1
        return res
