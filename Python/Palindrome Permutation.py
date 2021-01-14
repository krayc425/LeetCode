from collections import defaultdict


class Solution:
    def canPermutePalindrome(self, s: str) -> bool:
        map = defaultdict(int)
        for c in s:
            map[c] += 1
        odd = 0
        for (char, count) in map.items():
            if count % 2 == 1:
                odd += 1
        return odd <= 1
