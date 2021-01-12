from typing import List
from collections import defaultdict


class Solution:
    def uncommonFromSentences(self, A: str, B: str) -> List[str]:
        map = defaultdict(int)
        for w in A.split():
            map[w] += 1
        for w in B.split():
            map[w] += 1
        res = []
        for w, c in map.items():
            if c == 1:
                res.append(w)
        return res
