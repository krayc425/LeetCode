from typing import List


class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        self.res = []

        def backtrack(temp: List[int], target: int, start: int):
            if len(temp) == k and target == 0:
                self.res.append(temp[:])
                return
            if start > 9:
                return
            for i in range(start, 10):
                temp.append(i)
                backtrack(temp, target - i, i + 1)
                temp.pop()

        backtrack([], n, 1)
        return self.res
