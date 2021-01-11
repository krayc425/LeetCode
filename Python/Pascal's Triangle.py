from typing import List


class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        if numRows == 0:
            return []
        res = [[1]]
        curr_row = 1
        while curr_row < numRows:
            temp = [1]
            for i in range(len(res[-1]) - 1):
                temp.append(res[-1][i] + res[-1][i + 1])
            temp.append(1)
            res.append(temp)
            curr_row += 1
        return res
