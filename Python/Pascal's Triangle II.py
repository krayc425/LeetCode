from typing import List


class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        if rowIndex == 0:
            return [1]
        res = [1]
        curr_row = 0
        while curr_row < rowIndex:
            temp = [1]
            for i in range(len(res) - 1):
                temp.append(res[i] + res[i + 1])
            temp.append(1)
            curr_row += 1
            res = temp
        return res
