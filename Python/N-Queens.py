from typing import List


class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        board = ["." * n for _ in range(n)]
        res = []

        def valid(board: List[str], row, col: int):
            for i in range(row):
                if board[i][col] == "Q":
                    return False
            r, c = row - 1, col - 1
            while r >= 0 and c >= 0:
                if board[r][c] == "Q":
                    return False
                r -= 1
                c -= 1
            r, c = row - 1, col + 1
            while r >= 0 and c < n:
                if board[r][c] == "Q":
                    return False
                r -= 1
                c += 1
            return True

        def backtrack(board: List[str], row: int):
            if row == n:
                res.append(board[:])
                return
            for i in range(n):
                board[row] = board[row][:i] + "Q" + board[row][i + 1:]
                if valid(board, row, i):
                    backtrack(board, row + 1)
                board[row] = board[row][:i] + "." + board[row][i + 1:]

        backtrack(board, 0)
        return res
