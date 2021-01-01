from typing import List


class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        if n == 0:
            return []
        if n == 1:
            return ["()"]
        res = []

        def backtrack(s: str, l: int, r: int):
            if len(s) == 2 * n:
                res.append(s)
                return
            if l < n:
                backtrack(s + "(", l + 1, r)
            if r < l:
                backtrack(s + ")", l, r + 1)

        backtrack("", 0, 0)
        return res
