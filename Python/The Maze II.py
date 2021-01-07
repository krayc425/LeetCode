from typing import List
from collections import deque


class Solution:
    def shortestDistance(self, maze: List[List[int]], start: List[int], destination: List[int]) -> int:
        m, n = len(maze), len(maze[0])
        directions = [[-1, 0], [0, -1], [1, 0], [0, 1]]
        q = deque()
        q.append(start)
        distance = [[float('inf') for _ in range(n)] for _ in range(m)]
        distance[start[0]][start[1]] = 0
        while q:
            prev = q.popleft()
            for d in directions:
                x = d[0] + prev[0]
                y = d[1] + prev[1]
                count = 0
                while 0 <= x < m and 0 <= y < n and maze[x][y] == 0:
                    x += d[0]
                    y += d[1]
                    count += 1
                last = [x - d[0], y - d[1]]
                if distance[prev[0]][prev[1]] + count < distance[last[0]][last[1]]:
                    distance[last[0]][last[1]] = distance[prev[0]][prev[1]] + count
                    q.append(last)
        destination_distance = distance[destination[0]][destination[1]]
        return destination_distance if destination_distance != float('inf') else -1
