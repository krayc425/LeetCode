from typing import List


class Solution:
    def generatePalindromes(self, s: str) -> List[str]:
        chars = []
        char_set = set()
        for c in s:
            if c not in char_set:
                char_set.add(c)
            else:
                chars.append(c)
                char_set.remove(c)
        if len(char_set) > 1:
            return []
        mid = "" if len(char_set) == 0 else char_set.pop()
        permutations = []
        self.getPermutations(permutations, [], [False] * len(chars), sorted(chars))
        # str + mid + reverse(str)
        return [x + mid + "".join(reversed(x)) for x in permutations]

    def getPermutations(self, result, item, visited, chars):
        # backtrack
        if len(item) == len(chars):
            result.append(''.join(item))
            return

        for i in range(len(chars)):
            if visited[i]:
                continue
            # avoid duplicates
            if i > 0 and chars[i - 1] == chars[i] and not visited[i - 1]:
                continue

            visited[i] = True
            item.append(chars[i])
            self.getPermutations(result, item, visited, chars)
            item.pop()
            visited[i] = False


if __name__ == "__main__":
    s = Solution()
    print(s.generatePalindromes("aaff"))
