from typing import List


class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        n = len(strs)
        if n == 0:
            return ""
        if n == 1:
            return strs[0]
        res = ""
        min_len = min([len(s) for s in strs])
        for i in range(min_len):
            curr_char = strs[0][i]
            all_found = True
            for j in range(1, n):
                if strs[j][i] != curr_char:
                    all_found = False
                    break
            if all_found:
                res += curr_char
            else:
                break
        return res
