class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        if len(s) == 0:
            return 0
        char_set = set()
        left, right = 0, 0
        res = 0
        n = len(s)
        while left < n and right < n:
            if s[right] in char_set:
                char_set.remove(s[left])
                left += 1
            else:
                char_set.add(s[right])
                res = max(res, right - left + 1)
                right += 1
        return res
