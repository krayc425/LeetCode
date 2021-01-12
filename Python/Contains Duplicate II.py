from typing import List


class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        map = {}
        for i, n in enumerate(nums):
            if n in map:
                if i - map[n] <= k:
                    return True
            map[n] = i
        return False
