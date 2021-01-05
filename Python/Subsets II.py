from typing import List


class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        if n == 0:
            return []

        def backtrack(start: int, count: int, result: List[List[int]], temp: List[int]):
            if len(temp) == count:
                result.append(temp[:])
                return
            for i in range(start, n):
                if i == start or nums[i] != nums[i - 1]:
                    temp.append(nums[i])
                    backtrack(i + 1, count, result, temp)
                    temp.pop()

        res = []
        nums.sort()
        for i in range(n + 1):
            temp = []
            backtrack(0, i, res, temp)
        return res
