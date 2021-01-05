from typing import List


class Solution:
    def longestMountain(self, arr: List[int]) -> int:
        n = len(arr)
        if len(arr) <= 2:
            return 0
        start, end = 0, 0
        res = 0
        while start < n:
            end = start
            if end < n - 1 and arr[end] < arr[end + 1]:
                while end < n - 1 and arr[end] < arr[end + 1]:
                    end += 1
                if end < n - 1 and arr[end] > arr[end + 1]:
                    while end < n - 1 and arr[end] > arr[end + 1]:
                        end += 1
                    res = max(res, end - start + 1)
            start = max(end, start + 1)
        return res
