from typing import List
from collections import deque


class Solution:
    def hasPath(self, maze: List[List[int]], start: List[int], destination: List[int]) -> bool:
        m, n = len(maze), len(maze[0])
        directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]
        q = deque()
        q.append(start)
        visited = [[False for _ in range(n)] for _ in range(m)]
        while q:
            prev = q.popleft()
            if prev == destination:
                return True
            for d in directions:
                x = d[0] + prev[0]
                y = d[1] + prev[1]
                while 0 <= x < m and 0 <= y < n and maze[x][y] == 0:
                    x += d[0]
                    y += d[1]
                last = [x - d[0], y - d[1]]
                if not visited[last[0]][last[1]]:
                    visited[last[0]][last[1]] = True
                    q.append(last)
        return False
