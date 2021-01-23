class Solution:
    def longestPalindrome(self, s: str) -> str:
        n = len(s)
        if n <= 1:
            return s

        def expand(start: int, end: int) -> int:
            l, r = start, end
            while l >= 0 and r < n and s[l] == s[r]:
                l -= 1
                r += 1
            return r - l - 1

        start, end = 0, 0
        for i in range(n):
            len_1 = expand(i, i)
            len_2 = expand(i, i + 1)
            max_len = max(len_1, len_2)
            if max_len > end - start:
                start = int(i - (max_len - 1) // 2)
                end = int(i + max_len // 2)
        return s[start:(end + 1)]
