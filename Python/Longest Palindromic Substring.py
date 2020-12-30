class Solution:
    def expand(self, s: str, start: int, end: int) -> int:
        l, r = start, end
        while l >= 0 and r < len(s) and s[l] == s[r]:
            l -= 1
            r += 1
        return r - l - 1

    def longestPalindrome(self, s: str) -> str:
        if len(s) <= 1:
            return s
        start, end = 0, 0
        for i in range(len(s)):
            len_1 = self.expand(s, i, i)
            len_2 = self.expand(s, i, i + 1)
            max_len = max(len_1, len_2)
            if max_len > end - start:
                start = i - (max_len - 1) / 2
                end = i + max_len / 2
        return s[start:end + 1]
