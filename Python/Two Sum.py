from typing import List


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        map = {}
        for idx, n in enumerate(nums):
            if map.get(target - n) is not None:
                return [map.get(target - n), idx]
            map[n] = idx
        return []
