from typing import List, Set, Tuple


class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        n = len(candidates)

        def backtrack(res: Set[Tuple[int]], temp: List[int], start: int, target: int):
            if target < 0 or start > n:
                return
            if target == 0:
                res.add(tuple(temp))
                return
            for i in range(start, n):
                if i > start and candidates[i] == candidates[i - 1]:
                    continue
                temp.append(candidates[i])
                backtrack(res, temp, i + 1, target - candidates[i])
                temp.pop()

        res = set()
        temp = []
        candidates.sort()
        backtrack(res, temp, 0, target)
        return list(res)
