from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        map = {}
        for idx, n in enumerate(nums):
            if target - n in map:
                return [map[target - n], idx]
            map[n] = idx
        return []
