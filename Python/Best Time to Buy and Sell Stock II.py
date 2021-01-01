from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        res = 0
        for i in range(len(prices) - 1):
            delta = prices[i + 1] - prices[i]
            if delta > 0:
                res += delta
        return res
