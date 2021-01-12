from typing import List


class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
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
