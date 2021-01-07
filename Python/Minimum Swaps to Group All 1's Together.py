from typing import List


class Solution:
    def minSwaps(self, data: List[int]) -> int:
        ones = sum(data)
        start, end = 0, ones
        curr_ones = 0
        for i in range(ones):
            if data[i] == 1:
                curr_ones += 1
        max_ones = curr_ones
        while end < len(data):
            if data[end] == 1:
                curr_ones += 1
            if data[start] == 1:
                curr_ones -= 1
            start += 1
            end += 1
            max_ones = max(max_ones, curr_ones)
        return ones - max_ones
