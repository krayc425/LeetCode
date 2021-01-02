class Solution:
    def reverseBits(self, n: int) -> int:
        res = 0
        pow = 31
        while n > 0:
            res += (n & 1) << pow
            n >>= 1
            pow -= 1
        return res
