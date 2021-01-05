from typing import List


class Solution:
    def canReach(self, arr: List[int], start: int) -> bool:
        n = len(arr)
        q = [start]
        visited = set()
        visited.add(start)
        while len(q) > 0:
            curr = q[0]
            if arr[curr] == 0:
                return True
            for next in [curr - arr[curr], curr + arr[curr]]:
                if 0 <= next < n and next not in visited:
                    visited.add(next)
                    q.append(next)
            q = q[1:]
        return False
