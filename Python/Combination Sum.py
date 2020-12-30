from typing import List


class Solution:
    def backtrack(self, res: List[List[int]], temp: List[int], candidates: List[int], start: int, target: int):
        if target == 0:
            res.append(temp[:])
            return
        if target < 0 or start >= len(candidates):
            return
        for i in range(start, len(candidates)):
            temp.append(candidates[i])
            self.backtrack(res, temp, candidates, i, target - candidates[i])
            temp.pop()

    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        temp = []
        self.backtrack(res, temp, candidates, 0, target)
        return res
