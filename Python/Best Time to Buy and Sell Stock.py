from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_p = float("inf")
        res = 0
        for p in prices:
            if p < min_p:
                min_p = p
            else:
                res = max(res, p - min_p)
        return res
