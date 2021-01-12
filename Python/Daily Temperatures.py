from typing import List


class Solution:
    def dailyTemperatures(self, T: List[int]) -> List[int]:
        n = len(T)
        stack = []  # store indexes
        res = []
        for i in range(n - 1, -1, -1):
            while len(stack) > 0 and T[i] >= T[stack[-1]]:
                stack.pop()
            res.append(0 if len(stack) == 0 else stack[-1] - i)
            stack.append(i)
        return res[::-1]
