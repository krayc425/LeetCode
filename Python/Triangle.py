from typing import List


class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        n = len(triangle)
        dp = triangle[0]
        for i in range(2, 1 + n):
            new_dp = []
            for j in range(i):
                if j == 0:
                    new_dp.append(triangle[i - 1][j] + dp[0])
                elif j == i - 1:
                    new_dp.append(triangle[i - 1][j] + dp[-1])
                else:
                    new_dp.append(triangle[i - 1][j] + min(dp[j - 1], dp[j]))
            dp = new_dp[:]
        return min(dp)
