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
                    visited[i] = True
                    temp.append(nums[i])
                    backtrack(result, visited, temp)
                    temp.pop()
                    visited[i] = False

        res = []
        temp = []
        visited = [False] * n
        backtrack(res, visited, temp)
        return res
