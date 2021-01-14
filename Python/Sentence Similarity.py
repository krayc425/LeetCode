from typing import List
from collections import defaultdict


class Solution:
    def areSentencesSimilar(self, sentence1: List[str], sentence2: List[str], similarPairs: List[List[str]]) -> bool:
        if len(sentence1) != len(sentence2):
            return False
        map = defaultdict(list)
        for w1, w2 in similarPairs:
            map[w1].append(w2)
            map[w2].append(w1)
        for w1, w2 in zip(sentence1, sentence2):
            if w1 == w2 or w2 in map[w1] or w1 in map[w2]:
                continue
            else:
                return False
        return True
