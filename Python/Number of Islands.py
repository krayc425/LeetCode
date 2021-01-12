from typing import List


class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        m, n = len(grid), len(grid[0])
        directions = [[-1, 0], [1, 0], [0, 1], [0, -1]]

        def dfs(i, j: int):
            if 0 <= i < m and 0 <= j < n and grid[i][j] == "1":
                grid[i][j] = "."
            for d in directions:
                new_i, new_j = i + d[0], j + d[1]
                if 0 <= new_i < m and 0 <= new_j < n and grid[new_i][new_j] == "1":
                    dfs(new_i, new_j)

        res = 0
        for i in range(m):
            for j in range(n):
                if grid[i][j] == "1":
                    res += 1
                    dfs(i, j)
        return res
