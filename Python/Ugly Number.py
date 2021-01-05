class Solution:
    def isUgly(self, num: int) -> bool:
        if num < 1:
            return False
        for f in [2, 3, 5]:
            while num % f == 0:
                num //= f
        return num == 1
