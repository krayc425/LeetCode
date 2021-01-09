from collections import Counter


class Solution:
    def minDeletions(self, s: str) -> int:
        count = Counter(s)
        res = 0
        freq = set()
        vals = reversed(sorted(count.values()))
        for v in vals:
            while v in freq:
                v -= 1
                res += 1
            if v > 0:
                freq.add(v)
        return res
