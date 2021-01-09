from typing import List


class Solution:
    def maxLength(self, arr: List[str]) -> int:
        n = len(arr)

        def backtrack(curr, start):
            curr_str = "".join(curr)
            curr_len, curr_set_len = len(curr_str), len(set(curr_str))
            if curr_len > curr_set_len:
                return
            if curr_len == curr_set_len:
                self.res = max(self.res, curr_len)
            if start > n:
                return
            for i in range(start, n):
                curr.append(arr[i])
                backtrack(curr, i + 1)
                curr.pop()

        self.res = 0
        backtrack([], 0)
        return self.res
