class Solution:
    def thousandSeparator(self, n: int) -> str:
        if n == 0:
            return "0"
        res = ""
        while n > 0:
            n, d = divmod(n, 1000)
            if len(res) == 0:
                res = "%03d" % d
            else:
                res = "%03d" % d + "." + res
        return res.lstrip("0")
