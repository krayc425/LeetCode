from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
        m, n = len(board), len(board[0])

        def backtrack(i, j: int, suffix: str):
            if len(suffix) == 0:
                return True
            if i < 0 or i >= m or j < 0 or j >= n or board[i][j] != suffix[0]:
                return False
            for d in directions:
                new_i = i + d[0]
                new_j = j + d[1]
                board[i][j] = "."
                if backtrack(new_i, new_j, suffix[1:]):
                    board[i][j] = suffix[0]
                    return True
                board[i][j] = suffix[0]
            return False

        for i in range(m):
            for j in range(n):
                if backtrack(i, j, word):
                    return True
        return False
