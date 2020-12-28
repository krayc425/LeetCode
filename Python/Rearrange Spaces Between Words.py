class Solution:
    def reorderSpaces(self, text: str) -> str:
        space_cnt = text.count(" ")
        words = text.split()
        word_cnt = len(words)
        if word_cnt == 1:
            return words[0] + " " * space_cnt
        else:
            space = " " * (space_cnt // (word_cnt - 1))
            end_space = " " * (space_cnt % (word_cnt - 1))
            return space.join(words) + end_space