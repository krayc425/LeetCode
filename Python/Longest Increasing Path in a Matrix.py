from typing import List


class Solution:
    def longestIncreasingPath(self, matrix: List[List[int]]) -> int:
        m, n = len(matrix), len(matrix[0])
        if m == 0 or n == 0:
            return 0

        directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

        def dfs(i, j: int, cache: List[List[int]]) -> int:
            if cache[i][j] != 0:
                return cache[i][j]
            for d in directions:
                d_i, d_j = i + d[0], j + d[1]
                if 0 <= d_i < m and 0 <= d_j < n and matrix[d_i][d_j] > matrix[i][j]:
                    cache[i][j] = max(cache[i][j], dfs(d_i, d_j, cache))
            cache[i][j] += 1
            return cache[i][j]

        res = 0
        cache = [[0 for _ in range(n)] for _ in range(m)]
        for i in range(m):
            for j in range(n):
                res = max(res, dfs(i, j, cache))
        return res
