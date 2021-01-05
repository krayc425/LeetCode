class Solution:
    def minWindow(self, s: str, t: str) -> str:
        map = {}
        for c in s:
            map[c] = 0
        for c in t:
            map[c] = map.get(c, 0) + 1
        start, end = 0, 0
        missing = len(t)
        res = float('inf')
        start_index = 0
        while end < len(s):
            end_char = s[end]
            if map[end_char] > 0:
                missing -= 1
            map[end_char] = map[end_char] - 1
            while missing == 0:
                if end - start + 1 < res:
                    res = end - start + 1
                    start_index = start
                start_char = s[start]
                map[start_char] = map[start_char] + 1
                if map[start_char] > 0:
                    missing += 1
                start += 1
            end += 1
        return s[start_index:start_index + res] if res != float('inf') else ""
