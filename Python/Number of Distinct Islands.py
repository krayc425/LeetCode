from typing import List


class Solution:
    def numDistinctIslands(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])
        visited = set()
        shapes = set()

        def dfs(i, j, direction, shape):
            if i < 0 or j < 0 or i >= m or j >= n or (i, j) in visited or grid[i][j] == 0:
                return
            visited.add((i, j))
            shape.append(direction)
            dfs(i + 1, j, 1, shape)
            dfs(i, j + 1, 2, shape)
            dfs(i - 1, j, 3, shape)
            dfs(i, j - 1, 4, shape)
            # to mark the end of the path
            shape.append(0)

        for i in range(m):
            for j in range(n):
                if grid[i][j] == 1:
                    shape = []
                    dfs(i, j, 0, shape)
                    if len(shape) > 0:
                        shapes.add(tuple(shape))
        return len(shapes)
