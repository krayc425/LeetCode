from typing import List


class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        if beginWord == endWord or endWord not in wordList:
            return 0
        wordList = set(wordList)
        visited = {beginWord}
        queue = [beginWord]
        step = 1
        while len(queue) > 0:
            n = len(queue)
            for i in range(n):
                oldWord = queue[i]
                for j in range(len(oldWord)):
                    for k in "qwertyuiopasdfghjklzxcvbnm":
                        newWord = oldWord[:j] + k + oldWord[j + 1:]
                        if newWord == endWord:
                            return step + 1
                        if newWord in wordList and newWord not in visited:
                            visited.add(newWord)
                            queue.append(newWord)
            queue = queue[n:]
            step += 1
        return 0
