from typing import List


class Solution:
    def countCornerRectangles(self, grid: List[List[int]]) -> int:
        m, n = len(grid), len(grid[0])
        count = [[0 for _ in range(n)] for _ in range(n)]
        res = 0
        for row in grid:
            for col, val in enumerate(row):
                if val == 1:
                    for nextCol in range(col + 1, n):
                        if row[nextCol] == 1:
                            res += count[col][nextCol]
                            count[col][nextCol] += 1
        return res
