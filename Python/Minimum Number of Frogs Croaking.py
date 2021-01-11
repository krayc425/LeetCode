from collections import Counter


class Solution:
    def minNumberOfFrogs(self, croakOfFrogs: str) -> int:
        count = Counter(croakOfFrogs)
        if sorted(set(count.keys())) != sorted(set("croak")) or len(set(count.values())) != 1:
            return -1
        word = "croak"
        letter_map = {}
        count_map = {}
        for i, c in enumerate(word):
            letter_map[c] = i
            count_map[c] = 0
        res = 0
        curr = 0
        for c in croakOfFrogs:
            if c not in letter_map:
                return -1
            if c == "c":
                curr += 1
                res = max(res, curr)
            else:
                index = letter_map[c]
                prev_char = word[index - 1]
                if count_map[prev_char] == 0:
                    return -1
                count_map[prev_char] = count_map[prev_char] - 1
                if c == "k":
                    curr -= 1
            count_map[c] = count_map[c] + 1
        return res
