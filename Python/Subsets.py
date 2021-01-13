from typing import List


class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        if n == 0:
            return []

        self.res = []

        def backtrack(start: int, count: int, temp: List[int]):
            if len(temp) == count:
                self.res.append(temp[:])
                return
            for i in range(start, n):
                temp.append(nums[i])
                backtrack(i + 1, count, temp)
                temp.pop()

        for i in range(n + 1):
            backtrack(0, i, [])
        return self.res
