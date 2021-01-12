from typing import List
from collections import defaultdict


class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        map = defaultdict(int)
        map[0] = 1
        sum = 0
        res = 0
        for n in nums:
            sum += n
            if sum - k in map:
                res += map[sum - k]
            map[sum] += 1
        return res
