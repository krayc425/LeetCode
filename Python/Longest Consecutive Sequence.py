from typing import List


class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        num_set = set(nums)
        res = 0
        for n in num_set:
            if n - 1 not in num_set:
                curr = 0
                i = n
                while i in num_set:
                    i += 1
                    curr += 1
                res = max(res, curr)
        return res
