from typing import List


class Solution:
    def dailyTemperatures(self, T: List[int]) -> List[int]:
        n = len(T)
        stack = []  # store indexes
        res = [0] * n
        for i in range(n):
            while len(stack) > 0 and T[i] > T[stack[-1]]:
                last = stack.pop()
                res[last] = i - last
            stack.append(i)
        return res
