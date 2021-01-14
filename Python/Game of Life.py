from typing import List


class Solution:
    def gameOfLife(self, board: List[List[int]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        m, n = len(board), len(board[0])
        directions = [(1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1)]

        # live: 1,  2 (dead -> live)
        # dead: 0, -1 (live -> dead)
        for i in range(m):
            for j in range(n):
                live_neighbors = 0
                for d in directions:
                    r, c = i + d[0], j + d[1]
                    if 0 <= r < m and 0 <= c < n and abs(board[r][c]) == 1:
                        live_neighbors += 1
                if board[i][j] == 1 and (live_neighbors < 2 or live_neighbors > 3):
                    board[i][j] = -1
                if board[i][j] == 0 and live_neighbors == 3:
                    board[i][j] = 2

        for i in range(m):
            for j in range(n):
                if board[i][j] > 0:
                    board[i][j] = 1
                else:
                    board[i][j] = 0
