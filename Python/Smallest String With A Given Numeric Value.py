class Solution:
    def getSmallestString(self, n: int, k: int) -> str:
        res = ["a"] * n
        i = n - 1
        k -= n
        while k > 0 and i >= 0:
            add = min(25, k)
            res[i] = chr(ord(res[i]) + add)
            i -= 1
            k -= add
        return ''.join(res)
