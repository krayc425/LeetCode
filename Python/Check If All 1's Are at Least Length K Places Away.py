from typing import List


class Solution:
    def kLengthApart(self, nums: List[int], k: int) -> bool:
        if k == 0:
            return True
        lastIdx = -1
        for i, n in enumerate(nums):
            if n == 1:
                if lastIdx != -1 and i - lastIdx - 1 < k:
                    return False
                lastIdx = i
        return True
