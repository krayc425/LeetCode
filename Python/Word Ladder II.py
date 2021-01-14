from typing import List
from collections import defaultdict


class Solution:
    def findLadders(self, beginWord: str, endWord: str, wordList: List[str]) -> List[List[str]]:
        if beginWord == endWord or endWord not in wordList:
            return []
        combos = defaultdict(list)
        for w in wordList:
            for i in range(len(w)):
                key = w[:i] + "*" + w[i + 1:]
                combos[key].append(w)
        q = [(beginWord, [beginWord])]
        word_set = set(beginWord)
        res = []
        while q and not res:
            temp_set = set()
            n = len(q)
            for i in range(n):
                word, path = q[i]
                for j in range(len(word)):
                    new_word = word[:j] + "*" + word[j + 1:]
                    for w in combos[new_word]:
                        if w == endWord:
                            res.append(path + [w])
                        if w not in word_set:
                            temp_set.add(w)
                            q.append((w, path + [w]))
            q = q[n:]
            word_set = word_set.union(temp_set)
        return res
