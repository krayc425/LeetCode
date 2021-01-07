from typing import List


class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)

        def backtrack(result: List[List[int]], visited: List[bool], temp: List[int]):
            if len(temp) == n:
                result.append(temp[:])
                return
            for i in range(n):
                if not visited[i]:
                    temp.append(nums[i])
                    visited[i] = True
                    backtrack(result, visited, temp)
                    visited[i] = False
                    temp.pop()

        res = []
        temp = []
        visited = [False] * n
        backtrack(res, visited, temp)
        return res
