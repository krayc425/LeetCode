from typing import List


class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        n = len(candidates)
        self.res = []

        def backtrack(temp: List[int], start: int, target: int):
            if target < 0 or start >= n:
                return
            if target == 0:
                self.res.append(temp[:])
                return
            for i in range(start, n):
                temp.append(candidates[i])
                backtrack(temp, i, target - candidates[i])
                temp.pop()

        backtrack([], 0, target)
        return self.res
