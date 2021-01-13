from typing import List


class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        if n == 0:
            return []

        self.res = []

        def backtrack(start: int, count: int, temp: List[int]):
            if len(temp) == count:
                self.res.append(temp[:])
                return
            for i in range(start, n):
                if i == start or nums[i] != nums[i - 1]:
                    temp.append(nums[i])
                    backtrack(i + 1, count, temp)
                    temp.pop()

        nums.sort()
        for i in range(n + 1):
            backtrack(0, i, [])
        return self.res
