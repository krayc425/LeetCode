from collections import defaultdict


class Solution:
    def longestSubstring(self, s: str, k: int) -> int:
        max_unique_letters = len(set(s))
        res = 0
        for i in range(1, 1 + max_unique_letters):
            start, end = 0, 0
            unique = 0
            at_least_k = 0
            map = defaultdict(int)
            while end < len(s):
                if unique <= i:
                    char = s[end]
                    if map[char] == 0:
                        unique += 1
                    map[char] += 1
                    if map[char] == k:
                        at_least_k += 1
                    end += 1
                else:
                    char = s[start]
                    if map[char] == k:
                        at_least_k -= 1
                    map[char] -= 1
                    if map[char] == 0:
                        unique -= 1
                    start += 1
                if unique == i and unique == at_least_k:
                    res = max(res, end - start)
        return res
