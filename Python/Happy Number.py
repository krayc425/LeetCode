class Solution:
    def isHappy(self, n: int) -> bool:
        if n == 1:
            return True
        seen = set()
        while n != 1 and n not in seen:
            seen.add(n)
            next = 0
            while n > 0:
                n, d = divmod(n, 10)
                next += d ** 2
            n = next
        return n == 1
