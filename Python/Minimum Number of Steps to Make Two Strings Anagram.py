from collections import defaultdict


class Solution:
    def minSteps(self, s: str, t: str) -> int:
        map = defaultdict(int)
        for char in s:
            map[char] += 1
        res = 0
        for char in t:
            if map[char]:
                map[char] -= 1
            else:
                res += 1
        return res
