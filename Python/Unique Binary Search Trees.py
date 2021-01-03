class Solution:
    def numTrees(self, n: int) -> int:
        if n <= 2:
            return n

        cache = {}

        def helper(start, end: int) -> int:
            if start >= end:
                return 1
            if end - start in cache:
                return cache[end - start]
            sum = 0
            for i in range(start, end + 1):
                sum += helper(start, i - 1) * helper(i + 1, end)
            cache[end - start] = sum
            return sum

        return helper(1, n)
