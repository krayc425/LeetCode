from typing import List


class Solution:
    def partitionLabels(self, S: str) -> List[int]:
        last_map = {}
        for i, c in enumerate(S):
            last_map[c] = i
        start, end = 0, 0
        res = []
        for i, c in enumerate(S):
            end = max(end, last_map[c])
            if end == i:
                res.append(end - start + 1)
                start = i + 1
        return res
