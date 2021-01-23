class Solution:
    def isOneEditDistance(self, s: str, t: str) -> bool:
        m, n = len(s), len(t)
        if s == t or abs(m - n) >= 2:
            return False
        i, j = 0, 0
        first_diff = False
        while i < m and j < n:
            if s[i] != t[j]:
                if first_diff:
                    return False
                first_diff = True
                if m < n:
                    i -= 1
                elif m > n:
                    j -= 1
            i += 1
            j += 1
        return True
