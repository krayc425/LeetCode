class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        if n == 0:
            return 0
        char_set = set()
        left, right = 0, 0
        res = 0
        while left < n and right < n:
            if s[right] in char_set:
                char_set.remove(s[left])
                left += 1
            else:
                char_set.add(s[right])
                right += 1
                res = max(res, right - left)
        return res
