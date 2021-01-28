from typing import List


class Solution:
    def fixedPoint(self, arr: List[int]) -> int:
        for i, n in enumerate(arr):
            if i == n:
                return i
        return -1
