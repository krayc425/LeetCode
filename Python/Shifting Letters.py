from typing import List


class Solution:
    def shiftingLetters(self, S: str, shifts: List[int]) -> str:
        n = len(S)
        letters = "abcdefghijklmnopqrstuvwxyz"
        alphabet = {idx: val for (idx, val) in enumerate(letters)}
        inverse_alphabet = {val: idx for (idx, val) in enumerate(letters)}
        for i in range(n - 1, 0, -1):
            shifts[i - 1] += shifts[i]
        res = ""
        for i, ch in enumerate(S):
            idx = inverse_alphabet[ch]
            res += alphabet[(idx + shifts[i]) % len(letters)]
        return res
