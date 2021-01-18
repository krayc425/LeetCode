class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        dp = [[0 for _ in range(n)] for _ in range(m)]
        dp[0][0] = 1 if text1[0] == text2[0] else 0
        for i in range(1, m):
            dp[i][0] = max(dp[i - 1][0], 1 if text1[i] == text2[0] else 0)
        for j in range(1, n):
            dp[0][j] = max(dp[0][j - 1], 1 if text2[j] == text1[0] else 0)
        for i in range(1, m):
            for j in range(1, n):
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                if text1[i] == text2[j]:
                    dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + 1)
        return max([max(row) for row in dp])
