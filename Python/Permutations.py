from typing import List


class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        self.res = []

        def backtrack(visited: List[bool], temp: List[int]):
            if len(temp) == n:
                self.res.append(temp[:])
                return
            for i in range(n):
                if not visited[i]:
                    temp.append(nums[i])
                    visited[i] = True
                    backtrack(visited, temp)
                    visited[i] = False
                    temp.pop()

        visited = [False] * n
        backtrack(visited, [])
        return self.res
