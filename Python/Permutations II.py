from typing import List, Set, Tuple


class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)

        def backtrack(res: Set[Tuple], temp: List[int], visited: Set[int]):
            if len(temp) == n:
                res.add(tuple(temp))
                return
            for i in range(n):
                if i not in visited:
                    temp.append(nums[i])
                    visited.add(i)
                    backtrack(res, temp, visited)
                    visited.remove(i)
                    temp.pop()

        res = set()
        visited = set()
        temp = []
        backtrack(res, temp, visited)
        return list(res)
