class Solution:
    def reverse(self, x: int) -> int:
        res = 0
        is_neg = x < 0
        x = abs(x)
        while x > 0:
            res *= 10
            res += x % 10
            x -= x % 10
            x /= 10
        if is_neg:
            if res > 1 << 31:
                return 0
            else:
                return int(-1 * res)
        else:
            if res > 1 << 32 - 1:
                return 0
            else:
                return int(res)
