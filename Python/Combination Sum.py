from typing import List


class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        n = len(candidates)

        def backtrack(res: List[List[int]], temp: List[int], start: int, target: int):
            if target < 0 or start >= n:
                return
            if target == 0:
                res.append(temp[:])
                return
            for i in range(start, n):
                temp.append(candidates[i])
                backtrack(res, temp, i, target - candidates[i])
                temp.pop()

        res = []
        temp = []
        backtrack(res, temp, 0, target)
        return res
