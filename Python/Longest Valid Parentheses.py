class Solution:
    def longestValidParentheses(self, s: str) -> int:
        n = len(s)
        dp = [0 for _ in range(n)]
        res = 0
        for i in range(1, n):
            if s[i] == ")":
                if s[i - 1] == "(":  # ...()
                    dp[i] = (dp[i - 2] if i >= 2 else 0) + 2
                elif i - 1 >= dp[i - 1] and s[i - 1 - dp[i - 1]] == "(":  # ...))
                    dp[i] = dp[i - 1] + (dp[i - 2 - dp[i - 1]] if i - 2 >= dp[i - 1] else 0) + 2
            res = max(res, dp[i])
        return res
