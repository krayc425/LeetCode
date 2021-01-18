from typing import List


class Solution:
    def findLength(self, A: List[int], B: List[int]) -> int:
        m, n = len(A), len(B)
        if m == 0 or n == 0:
            return 0
        dp = [[0 for _ in range(n + 1)] for _ in range(m + 1)]
        res = 0
        for i in range(m):
            for j in range(n):
                if A[i] == B[j]:
                    dp[i][j] = dp[i - 1][j - 1] + 1
                    res = max(res, dp[i][j])
        return res
