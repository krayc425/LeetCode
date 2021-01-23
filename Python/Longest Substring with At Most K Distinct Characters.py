from collections import defaultdict


class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        if len(s) == 0 or k == 0:
            return 0
        res = 1
        left = 0
        map = defaultdict(int)
        for right, char in enumerate(s):
            map[char] += 1
            while len(map) > k:
                left_char = s[left]
                map[left_char] -= 1
                if map[left_char] == 0:
                    del map[left_char]
                left += 1
            res = max(res, right - left + 1)
        return res
