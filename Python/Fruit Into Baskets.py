from typing import List
from collections import defaultdict


class Solution:
    def totalFruit(self, tree: List[int]) -> int:
        l, r = 0, 0
        n = len(tree)
        res = 0
        seen = defaultdict(int)
        while r < n:
            if tree[r] in seen or len(seen) < 2:
                seen[tree[r]] += 1
                res = max(res, r - l + 1)
            else:
                while len(seen) >= 2:
                    left_ele = tree[l]
                    seen[left_ele] -= 1
                    if seen[left_ele] == 0:
                        del seen[left_ele]
                    l += 1
                seen[tree[r]] = 1
            r += 1
        return res
