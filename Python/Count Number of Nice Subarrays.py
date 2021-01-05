from typing import List


class Solution:
    def numberOfSubarrays(self, nums: List[int], k: int) -> int:
        map = {0: 1}
        odd_count = 0
        res = 0
        for n in nums:
            if n % 2 == 1:
                odd_count += 1
            if odd_count - k in map:
                res += map[odd_count - k]
            map[odd_count] = map.get(odd_count, 0) + 1
        return res
