from typing import List


class Solution:
    def change(self, amount: int, coins: List[int]) -> int:
        dp = [1] + [0] * amount
        for c in coins:
            for amount in range(c, amount + 1):
                dp[amount] += dp[amount - c]
        return dp[amount]
