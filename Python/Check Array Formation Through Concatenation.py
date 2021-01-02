from typing import List


class Solution:
    def canFormArray(self, arr: List[int], pieces: List[List[int]]) -> bool:
        map = {}
        for i, n in enumerate(arr):
            map[n] = i
        visited = 0
        for p in pieces:
            p_ok = True
            p_base = -1
            a_base = -1
            for i, n in enumerate(p):
                if n not in map:
                    p_ok = False
                    break
                if p_base == -1:
                    p_base = i
                    a_base = map[n]
                else:
                    if i - p_base != map[n] - a_base:
                        p_ok = False
                        break
            if p_ok:
                visited += len(p)
        return visited == len(arr)
