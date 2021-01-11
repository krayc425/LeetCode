from typing import List
import SortedList

class Solution:
    def createSortedArray(self, instructions: List[int]) -> int:
        res = SortedList()
        mod = 10 ** 9 + 7
        cost = 0
        for n in instructions:
            left = res.bisect_left(n)
            right = len(res) - res.bisect_right(n)
            cost += min(left, right)
            res.add(n)
            cost %= mod
        return cost % mod
