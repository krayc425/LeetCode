from typing import List


class Solution:
    def grayCode(self, n: int) -> List[int]:
        if n <= 0:
            return []
        code = ["0", "1"]
        for i in range(1, n):
            first_half = ["0" + x for x in code]
            second_half = ["1" + x for x in code[::-1]]
            code = first_half + second_half
        return [int(x, 2) for x in code]
