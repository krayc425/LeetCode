from typing import List


class Solution:
    def uncommonFromSentences(self, A: str, B: str) -> List[str]:
        map = {}
        for w in A.split():
            map[w] = map.get(w, 0) + 1
        for w in B.split():
            map[w] = map.get(w, 0) + 1
        res = []
        for w, c in map.items():
            if c == 1:
                res.append(w)
        return res
