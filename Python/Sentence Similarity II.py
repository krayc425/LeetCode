from typing import List
from collections import defaultdict


class Solution:
    def areSentencesSimilarTwo(self, words1: List[str], words2: List[str], pairs: List[List[str]]) -> bool:
        if len(words1) != len(words2):
            return False
        graph = defaultdict(list)
        for w1, w2 in pairs:
            graph[w1].append(w2)
            graph[w2].append(w1)
        for w1, w2 in zip(words1, words2):
            stack = [w1]
            visited = {w1}
            found = False
            while len(stack) > 0:
                w = stack.pop()
                if w == w2:
                    found = True
                    break
                for neighbor in graph[w]:
                    if neighbor not in visited:
                        visited.add(neighbor)
                        stack.append(neighbor)
            if not found:
                return False
        return True
