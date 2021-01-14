from typing import List


class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        n = len(matrix)
        mid = n // 2
        for i in range(mid):
            end = n - 1 - i
            for j in range(end - i):
                curr = matrix[i][i + j]
                matrix[i][i + j] = matrix[end - j][i]
                matrix[end - j][i] = matrix[end][end - j]
                matrix[end][end - j] = matrix[i + j][end]
                matrix[i + j][end] = curr
