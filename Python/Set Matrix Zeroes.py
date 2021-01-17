from typing import List


class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        first_zero_row = -1
        first_zero_col = -1
        m, n = len(matrix), len(matrix[0])
        for i in range(m):
            if i == first_zero_row:
                continue
            for j in range(n):
                if j == first_zero_col:
                    continue
                if matrix[i][j] == 0:
                    if first_zero_row == -1 and first_zero_col == -1:
                        first_zero_row, first_zero_col = i, j
                        for k in range(m):
                            if matrix[k][j] == 0:
                                matrix[k][j] = 1
                            else:
                                matrix[k][j] = 0
                        for k in range(n):
                            if matrix[i][k] == 0:
                                matrix[i][k] = 1
                            else:
                                matrix[i][k] = 0
                        break
                    else:
                        matrix[first_zero_row][j] = 1
                        matrix[i][first_zero_col] = 1
        if first_zero_row == -1 and first_zero_col == -1:
            return
        for i in range(m):
            if matrix[i][first_zero_col] == 1:
                for j in range(n):
                    matrix[i][j] = 0
        for i in range(n):
            if matrix[first_zero_row][i] == 1:
                for j in range(m):
                    matrix[j][i] = 0
