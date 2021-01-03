from typing import List


class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        map = {}
        for t in tasks:
            map[t] = map.get(t, 0) + 1
        freqs = list(reversed(sorted(map.values())))
        max_freq = freqs[0]
        idle_slot = (max_freq - 1) * n
        for f in freqs[1:]:
            idle_slot -= min(max_freq - 1, f)
        return len(tasks) + max(0, idle_slot)
