from typing import List


class Solution:
    def backtrack(self, res: List[List[int]], temp: List[int], target: int, k: int, start: int):
        if len(temp) == k and target == 0:
            res.append(temp[:])
            return
        if start > 9:
            return
        for i in range(start, 10):
            temp.append(i)
            self.backtrack(res, temp, target - i, k, i + 1)
            temp.pop()

    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        res = []
        temp = []
        self.backtrack(res, temp, n, k, 1)
        return res
