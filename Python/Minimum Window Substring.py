from collections import defaultdict


class Solution:
    def minWindow(self, s: str, t: str) -> str:
        map = defaultdict(int)
        for c in s:
            map[c] = 0
        for c in t:
            map[c] += 1
        start, end = 0, 0
        missing = len(t)
        res = float('inf')
        res_index = 0
        while end < len(s):
            end_char = s[end]
            if map[end_char] > 0:
                missing -= 1
            map[end_char] -= 1
            while missing == 0:
                if end - start + 1 < res:
                    res = end - start + 1
                    res_index = start
                start_char = s[start]
                map[start_char] += 1
                if map[start_char] > 0:
                    missing += 1
                start += 1
            end += 1
        return s[res_index:res_index + res] if res != float('inf') else ""
