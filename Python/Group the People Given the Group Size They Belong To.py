from typing import List
from collections import defaultdict


class Solution:
    def groupThePeople(self, groupSizes: List[int]) -> List[List[int]]:
        map = defaultdict(list)
        for idx, num in enumerate(groupSizes):
            map[num].append(idx)
        res = []
        for size, ids in map.items():
            curr_id = 0
            while curr_id < len(ids):
                res.append(ids[curr_id:curr_id + size])
                curr_id += size
        return res
