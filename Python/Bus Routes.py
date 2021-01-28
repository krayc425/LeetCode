from typing import List
from collections import defaultdict, deque


class Solution:
    def numBusesToDestination(self, routes: List[List[int]], S: int, T: int) -> int:
        if S == T:
            return 0
        graph = defaultdict(set)
        for bus, route in enumerate(routes):
            for stop in route:
                graph[stop].add(bus)
        q = deque()
        for start in graph[S]:
            q.append((routes[start], [start]))
        while len(q) > 0:
            stops, path = q.popleft()
            for stop in stops:
                if stop == T:
                    return len(path)
                for neighbor in graph[stop]:
                    if neighbor not in path:
                        q.append((routes[neighbor], path + [neighbor]))
        return -1
