from typing import List


class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        n = len(intervals)
        res = 0
        count = 0
        starts = sorted([x[0] for x in intervals])
        ends = sorted(x[1] for x in intervals)
        i, j = 0, 0
        while i < n and j < n:
            if starts[i] < ends[j]:
                count += 1
                i += 1
            else:
                count -= 1
                j += 1
            res = max(res, count)
        return res
