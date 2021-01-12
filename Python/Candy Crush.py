from typing import List


class Solution:
    def candyCrush(self, board: List[List[int]]) -> List[List[int]]:
        m, n = len(board), len(board[0])
        while True:
            execute = False
            # crush
            for i in range(m):
                for j in range(n - 2):
                    if abs(board[i][j]) == abs(board[i][j + 1]) == abs(board[i][j + 2]) != 0:
                        board[i][j] = board[i][j + 1] = board[i][j + 2] = -abs(board[i][j])
                        execute = True
            for i in range(m - 2):
                for j in range(n):
                    if abs(board[i][j]) == abs(board[i + 1][j]) == abs(board[i + 2][j]) != 0:
                        board[i][j] = board[i + 1][j] = board[i + 2][j] = -abs(board[i][j])
                        execute = True
            # gravity
            for j in range(n):
                curr_row = m - 1
                for i in range(m - 1, -1, -1):
                    if board[i][j] > 0:
                        board[curr_row][j] = board[i][j]
                        curr_row -= 1
                for i in range(curr_row, -1, -1):
                    board[i][j] = 0
            if not execute:
                break
        return board
