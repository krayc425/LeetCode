from typing import List


class Solution:
    def trap(self, height: List[int]) -> int:
        n = len(height)
        if n < 3:
            return 0
        left_max = [height[0]]
        for i in range(1, n):
            left_max.append(max(left_max[-1], height[i]))
        right_max = [height[-1]]
        for i in range(n - 2, -1, -1):
            right_max.insert(0, max(right_max[0], height[i]))
        res = 0
        for i in range(1, n - 1):
            res += max(min(left_max[i - 1], right_max[i + 1]) - height[i], 0)
        return res
