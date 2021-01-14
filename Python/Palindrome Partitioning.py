from typing import List


class Solution:
    def partition(self, s: str) -> List[List[str]]:
        self.res = []
        n = len(s)

        def backtrack(temp, start, s):
            if start > n:
                return
            if len(s) == 0:
                if len(temp) > 0:
                    self.res.append(temp[:])
                return
            for i in range(len(s)):
                first = s[:i + 1]
                second = s[i + 1:]
                if first == first[::-1]:
                    temp.append(first)
                    backtrack(temp, i + 1, second)
                    temp.pop()

        backtrack([], 0, s)
        return self.res
