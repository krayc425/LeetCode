from typing import List


class Solution:
    def backtrack(self, result: List[List[int]], visited: List[bool], temp: List[int], nums: List[int]):
        if len(temp) == len(nums):
            result.append(temp[:])
            return
        for i in range(len(nums)):
            if not visited[i]:
                visited[i] = True
                temp.append(nums[i])
                self.backtrack(result, visited, temp, nums)
                temp.pop()
                visited[i] = False

    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        temp = []
        visited = [False] * len(nums)
        self.backtrack(res, visited, temp, nums)
        return res
