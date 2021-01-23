from typing import List


class Solution:
    def largestNumber(self, nums: List[int]) -> str:
        strs = [str(n) for n in nums]
        n = len(nums)
        for i in range(n):
            j = i + 1
            while j < n:
                if strs[i] + strs[j] <= strs[j] + strs[i]:
                    strs[i], strs[j] = strs[j], strs[i]
                j += 1
        return "".join(strs).lstrip("0") or "0"
