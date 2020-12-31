class Solution:
    def removeKdigits(self, num: str, k: int) -> str:
        res = ""
        keep = len(num) - k
        for c in num:
            while k > 0 and len(res) > 0 and res[-1] > c:
                res = res[:-1]
                k -= 1
            res += c
        res = res[:keep].lstrip("0")
        return "0" if len(res) == 0 else res
