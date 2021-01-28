from typing import List


class Solution:
    def diagonalSort(self, mat: List[List[int]]) -> List[List[int]]:
        m, n = len(mat), len(mat[0])
        res = [[0 for _ in range(n)] for _ in range(m)]
        beginX, beginY = m - 1, 0
        endX, endY = m - 1, 0
        curr = 0
        while curr < m + n - 1:
            temp = []
            for i in range(endX - beginX + 1):
                temp.append(mat[beginX + i][beginY + i])
            temp.sort()
            for i in range(endX - beginX + 1):
                res[beginX + i][beginY + i] = temp[i]
            if beginX > 0:
                beginX -= 1
            else:
                beginY += 1
            if endY < n - 1:
                endY += 1
            else:
                endX -= 1
            curr += 1
        return res
