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

        n = len(chars)

        def backtrack(result, temp, visited, chars):
            if len(temp) == n:
                result.append(''.join(temp))
                return
            for i in range(n):
                if visited[i]:
                    continue
                if i > 0 and chars[i - 1] == chars[i] and not visited[i - 1]:
                    continue
                temp.append(chars[i])
                visited[i] = True
                backtrack(result, temp, visited, chars)
                visited[i] = False
                temp.pop()

        permutations = []
        visited = [False] * n
        chars.sort()
        backtrack(permutations, [], visited, chars)
        # str + mid + reverse(str)
        return [x + mid + x[::-1] for x in permutations]
