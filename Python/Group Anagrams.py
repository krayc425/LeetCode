from typing import List


class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        map = {}
        for s in strs:
            key = tuple(sorted(s))
            map[key] = map.get(key, []) + [s]
        return list(map.values())
