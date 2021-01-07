from typing import List


class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        if len(arr) == 0:
            return k
        min_ele = arr[0]
        if min_ele > k:
            return k
        missed_cnt = 0
        i = 1
        j = 0
        while j < len(arr):
            if arr[j] == i:
                j += 1
            else:
                missed_cnt += 1
            if missed_cnt == k:
                return i
            i += 1
        return len(arr) + k
