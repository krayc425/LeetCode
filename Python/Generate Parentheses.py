from typing import List


class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = []

        def backtrack(s: str, l: int, r: int):
            if l < r:
                return
            if len(s) == 2 * n:
                res.append(s)
                return
            if l < n:
                backtrack(s + "(", l + 1, r)
            if r < n:
                backtrack(s + ")", l, r + 1)

        backtrack("", 0, 0)
        return res
