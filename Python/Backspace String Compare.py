class Solution:
    def backspaceCompare(self, S: str, T: str) -> bool:
        i, j = len(S) - 1, len(T) - 1
        skip_i, skip_j = 0, 0
        while i >= 0 or j >= 0:
            while i >= 0:
                if S[i] == "#":
                    skip_i += 1
                    i -= 1
                elif skip_i > 0:
                    skip_i -= 1
                    i -= 1
                else:
                    break
            while j >= 0:
                if T[j] == "#":
                    skip_j += 1
                    j -= 1
                elif skip_j > 0:
                    skip_j -= 1
                    j -= 1
                else:
                    break
            if i >= 0 and j >= 0 and S[i] != T[j]:
                return False
            # if one of the string is already empty
            if (i >= 0) != (j >= 0):
                return False
            i -= 1
            j -= 1
        return True
