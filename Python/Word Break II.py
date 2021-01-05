from typing import List
from collections import Counter


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> List[str]:
        if set(Counter(s).keys()) > set(Counter("".join(wordDict)).keys()):
            return []
        n = len(s)
        dp = [[""]] + [[]] * n
        word_set = set(wordDict)
        for i in range(1, 1 + n):
            temp = []
            for j in range(i):
                word = s[j:i]
                if word in word_set:
                    for sub in dp[j]:
                        temp.append((sub + " " + word).strip())
            dp[i] = temp
        return dp[n]
