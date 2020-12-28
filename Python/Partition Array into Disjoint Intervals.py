from typing import List


class Solution:
    def partitionDisjoint(self, A: List[int]) -> int:
        min_arr = []
        max_arr = []
        curr_min = float('inf')
        curr_max = float('-inf')
        for val in A:
            curr_max = max(curr_max, val)
            max_arr.append(curr_max)
        for val in reversed(A):
            curr_min = min(curr_min, val)
            min_arr.append(curr_min)
        min_arr.reverse()
        for i in range(len(A) - 1):
            if max_arr[i] <= min_arr[i + 1]:
                return i + 1
        return 0
