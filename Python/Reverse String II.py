class Solution:
    def reverseStr(self, s: str, k: int) -> str:
        res = ""
        while len(s) > 0:
            curr = s[:2 * k] if len(s) >= 2 * k else s
            res += curr[:k][::-1]
            res += curr[k:]
            s = s[2 * k:]
        return res
