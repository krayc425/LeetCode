from typing import List


class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        def backtrack(res: List[List[int]], temp: List[int], target: int, start: int):
            if len(temp) == k and target == 0:
                res.append(temp[:])
                return
            if start > 9:
                return
            for i in range(start, 10):
                temp.append(i)
                backtrack(res, temp, target - i, i + 1)
                temp.pop()

        res = []
        temp = []
        backtrack(res, temp, n, 1)
        return res
