from typing import List
from collections import defaultdict


class Solution:
    def wordSubsets(self, A: List[str], B: List[str]) -> List[str]:
        def count(word: str):
            arr = [0] * 26
            for char in word:
                arr[ord(char) - ord('a')] += 1
            return arr

        b_max_count = [0] * 26
        for b in B:
            for idx, cnt in enumerate(count(b)):
                b_max_count[idx] = max(b_max_count[idx], cnt)
        res = []
        for a in A:
            if all((x >= y for (x, y) in zip(count(a), b_max_count))):
                res.append(a)
        return res
