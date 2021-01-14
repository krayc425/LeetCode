from typing import List


class Solution:
    def removeSubfolders(self, folder: List[str]) -> List[str]:
        n = len(folder)
        if n == 0:
            return []
        folder.sort()
        res = [folder[0]]
        prev = folder[0] + "/"
        for i in range(1, n):
            curr = folder[i]
            if not curr.startswith(prev):
                res.append(curr)
                prev = curr + "/"
        return res
