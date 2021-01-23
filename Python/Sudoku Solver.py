from typing import List


class Solution:
    def solveSudoku(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """

        # Time Complexity: O((9!) ^ 9)

        def isValid(b, i, j, char):
            for k in range(9):
                if b[i][k] != "." and b[i][k] == char:
                    return False
                if b[k][j] != "." and b[k][j] == char:
                    return False
                r, c = 3 * (i // 3) + k // 3, 3 * (j // 3) + k % 3
                if b[r][c] != "." and b[r][c] == char:
                    return False
            return True

        def backtrack(b):
            for i in range(9):
                for j in range(9):
                    if b[i][j] == ".":
                        for char in "123456789":
                            if isValid(b, i, j, char):
                                b[i][j] = char
                                if backtrack(b):
                                    return True
                                b[i][j] = "."
                        return False
            return True

        backtrack(board)
