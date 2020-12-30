from typing import List


class Solution:
    def backtrack(self, nums: List[int], start: int, count: int, result: List[List[int]], temp: List[int]):
        if len(temp) == count:
            result.append(temp[:])
            return
        for i in range(start, len(nums)):
            temp.append(nums[i])
            self.backtrack(nums, i + 1, count, result, temp)
            temp.pop()

    def subsets(self, nums: List[int]) -> List[List[int]]:
        if len(nums) == 0:
            return []
        res = []
        for i in range(len(nums) + 1):
            temp = []
            self.backtrack(nums, 0, i, res, temp)
        return res
