from typing import List


class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        if len(nums) == 0:
            return []
        n = len(nums)

        def backtrack(start: int, count: int, result: List[List[int]], temp: List[int]):
            if len(temp) == count:
                result.append(temp[:])
                return
            for i in range(start, n):
                temp.append(nums[i])
                backtrack(i + 1, count, result, temp)
                temp.pop()

        res = []
        for i in range(n + 1):
            temp = []
            backtrack(0, i, res, temp)
        return res
