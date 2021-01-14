from typing import List
from collections import deque


class Solution:
    def solve(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        m = len(board)
        if m == 0:
            return
        n = len(board[0])
        if n == 0:
            return

        def bfs(i, j):
            q = deque([(i, j)])
            while len(q) > 0:
                (i, j) = q.popleft()
                if board[i][j] != "O":
                    continue
                board[i][j] = "E"
                if j < n - 1:
                    q.append((i, j + 1))
                if i < m - 1:
                    q.append((i + 1, j))
                if j > 0:
                    q.append((i, j - 1))
                if i > 0:
                    q.append((i - 1, j))

        # handle "O" on borders only (escaping cells)
        for i in range(m):
            if i == 0 or i == m - 1:
                for j in range(n):
                    if board[i][j] == "O":
                        bfs(i, j)
            else:
                for j in [0, n - 1]:
                    if board[i][j] == "O":
                        bfs(i, j)

        for i in range(m):
            for j in range(n):
                if board[i][j] == "E":
                    board[i][j] = "O"
                elif board[i][j] == "O":
                    board[i][j] = "X"
