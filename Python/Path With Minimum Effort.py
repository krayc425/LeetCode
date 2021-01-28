from typing import List
from collections import deque


class Solution:
    def minimumEffortPath(self, heights: List[List[int]]) -> int:
        m, n = len(heights), len(heights[0])

        directions = [[0, -1], [-1, 0], [0, 1], [1, 0]]

        def canReach(threshold: int):
            visited = [[False for _ in range(n)] for _ in range(m)]
            q = deque([(0, 0)])
            while len(q) > 0:
                i, j = q.popleft()
                if i == m - 1 and j == n - 1:
                    return True
                visited[i][j] = True
                for d in directions:
                    new_i, new_j = i + d[0], j + d[1]
                    if 0 <= new_i < m and 0 <= new_j < n and not visited[new_i][new_j]:
                        curr_diff = abs(heights[i][j] - heights[new_i][new_j])
                        if curr_diff <= threshold:
                            visited[new_i][new_j] = True
                            q.append((new_i, new_j))
            return False

        l, r = 0, 10 ** 6
        while l < r:
            mid = (l + r) // 2
            if canReach(mid):
                r = mid
            else:
                l = mid + 1
        return l
