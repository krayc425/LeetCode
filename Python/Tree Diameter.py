from typing import List


class Solution:
    def treeDiameter(self, edges: List[List[int]]) -> int:
        g = [set() for _ in range(len(edges) + 1)]
        for e in edges:
            u, v = e[0], e[1]
            g[u].add(v)
            g[v].add(u)

        def bfs(start: int) -> (int, int):
            q = [start]
            visited = {start}
            step = -1
            last = -1
            while len(q) > 0:
                n = len(q)
                step += 1
                for i in range(n):
                    first = q[i]
                    for child in g[first]:
                        if child not in visited:
                            visited.add(child)
                            q.append(child)
                            last = child
                q = q[n:]
            return last, step

        first_extreme, _ = bfs(0)
        _, res = bfs(first_extreme)
        return res
