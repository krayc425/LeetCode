from typing import Set


class Solution:
    def countArrangement(self, n: int) -> int:
        if 1 <= n <= 2:
            return n
        self.count = 0

        def backtrack(curr: int, visited: Set):
            if curr > n:
                self.count += 1
                return
            for i in range(1, n + 1):
                if i not in visited and (i % curr == 0 or curr % i == 0):
                    visited.add(i)
                    backtrack(curr + 1, visited)
                    visited.remove(i)

        visited = set()
        backtrack(1, visited)
        return self.count
