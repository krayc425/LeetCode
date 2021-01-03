from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        left = [0] * n
        right = [0] * (n + 1)
        left_min, right_max = prices[0], prices[-1]
        for l in range(1, n):
            left[l] = max(left[l - 1], prices[l] - left_min)
            left_min = min(left_min, prices[l])
            r = n - 1 - l
            right[r] = max(right[r + 1], right_max - prices[r])
            right_max = max(right_max, prices[r])
        res = 0
        for i in range(n):
            res = max(res, right[i + 1] + left[i])
        return res
