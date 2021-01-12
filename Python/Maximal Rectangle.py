from typing import List


class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        # stack stores indexes, and heights[index] are in **increasing** order
        stack = []
        res = 0
        n = len(heights)
        for i, height in enumerate(heights):
            while len(stack) > 0 and height <= heights[stack[-1]]:
                curr_height = heights[stack.pop()]
                curr_width = i - 1 - (stack[-1] if len(stack) > 0 else -1)
                res = max(res, curr_height * curr_width)
            stack.append(i)
        while len(stack) > 0:
            curr_height = heights[stack.pop()]
            curr_width = n - 1 - (stack[-1] if len(stack) > 0 else -1)
            res = max(res, curr_height * curr_width)
        return res

    def maximalRectangle(self, matrix: List[List[str]]) -> int:
        m = len(matrix)
        if m == 0:
            return 0
        n = len(matrix[0])
        if n == 0:
            return 0
        dp = [0] * n
        res = 0
        for i in range(m):
            for j in range(n):
                dp[j] = dp[j] + 1 if matrix[i][j] == '1' else 0
            res = max(res, self.largestRectangleArea(dp))
        return res
