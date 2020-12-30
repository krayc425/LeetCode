class Solution:
    def validPalindrome(self, s: str) -> bool:
        def isPalindrome(s: str, start: int, end: int):
            while start < end and s[start] == s[end]:
                start += 1
                end -= 1
            return start >= end, start, end

        found, i, j = isPalindrome(s, 0, len(s) - 1)
        if found:
            return True
        found, _, _ = isPalindrome(s, i + 1, j)
        if found:
            return True
        found, _, _ = isPalindrome(s, i, j - 1)
        if found:
            return True
        return False
