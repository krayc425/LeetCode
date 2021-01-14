from math import sqrt


class Solution:
    def numSquares(self, n: int) -> int:
        squares = [i * i for i in range(int(sqrt(n)) + 1)]
        dp = [float('inf')] * (n + 1)
        dp[0] = 0
        for i in range(1, 1 + n):
            for s in squares:
                if i >= s:
                    dp[i] = min(dp[i - s] + 1, dp[i])
        return dp[n]
