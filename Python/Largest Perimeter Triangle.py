from typing import List


class Solution:
    def largestPerimeter(self, A: List[int]) -> int:
        n = len(A)
        if n < 3:
            return 0
        A.sort()
        A.reverse()
        for i in range(n - 2):
            if A[i] < A[i + 1] + A[i + 2]:
                return sum(A[i:i + 3])
        return 0
