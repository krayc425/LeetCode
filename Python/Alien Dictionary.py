from typing import List
from collections import defaultdict, deque


class Solution:
    def alienOrder(self, words: List[str]) -> str:
        in_degree = defaultdict(int)
        order_map = defaultdict(list)
        n = len(words)
        for w in words:
            for c in w:
                in_degree[c] = 0
                order_map[c] = []
        for i in range(1, n):
            first = words[i - 1]
            second = words[i]
            if len(first) > len(second) and first[:len(second)] == second:
                return ""
            for j in range(min(len(first), len(second))):
                if first[j] != second[j]:
                    if second[j] not in order_map[first[j]]:
                        in_degree[second[j]] += 1
                        order_map[first[j]].append(second[j])
                    break
        q = deque()
        for char, count in in_degree.items():
            if count == 0:
                q.append(char)
        res = ""
        while len(q) > 0:
            first = q.popleft()
            res += first
            for child in order_map[first]:
                in_degree[child] -= 1
                if in_degree[child] == 0:
                    q.append(child)
        return res if len(res) == len(order_map) else ""
