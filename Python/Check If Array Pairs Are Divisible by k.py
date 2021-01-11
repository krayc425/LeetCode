from typing import List


class Solution:
    def canArrange(self, arr: List[int], k: int) -> bool:
        mods = [0] * k
        for n in arr:
            mods[n % k] += 1
        if mods[0] % 2 != 0:
            return False
        for i in range(1, k):
            if mods[i] != mods[k - i]:
                return False
        return True
