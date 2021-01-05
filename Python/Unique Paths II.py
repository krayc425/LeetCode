from typing import List


class Solution:
    def uniquePathsWithObstacles(self, obstacleGrid: List[List[int]]) -> int:
        m, n = len(obstacleGrid), len(obstacleGrid[0])
        dp = [[0 for _ in range(n)] for _ in range(m)]
        has_obstacle = False
        for i in range(m):
            if obstacleGrid[i][0] == 1:
                has_obstacle = True
                dp[i][0] = 0
            else:
                dp[i][0] = 0 if has_obstacle else 1
        has_obstacle = False
        for i in range(n):
            if obstacleGrid[0][i] == 1:
                has_obstacle = True
                dp[0][i] = 0
            else:
                dp[0][i] = 0 if has_obstacle else 1
        for i in range(1, m):
            for j in range(1, n):
                if obstacleGrid[i][j] == 1:
                    dp[i][j] = 0
                else:
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        return dp[m - 1][n - 1]
