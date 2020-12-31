from typing import List


class Solution:
    def numSubarrayBoundedMax(self, A: List[int], L: int, R: int) -> int:
        if len(A) == 0:
            return 0

        def countLessOrEqual(bound: int) -> int:
            res = 0
            curr = 0
            for n in A:
                if n <= bound:
                    curr += 1
                    res += curr
                else:
                    curr = 0
            return res

        return countLessOrEqual(R) - countLessOrEqual(L - 1)
