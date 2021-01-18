class Solution:
    def countVowelStrings(self, n: int) -> int:
        if n == 0:
            return 0
        if n == 1:
            return 5

        vowels = "aeiou"
        self.count = 0

        def backtrack(temp, start):
            if len(temp) == n:
                self.count += 1
                return
            for v in vowels:
                if len(temp) == 0 or v >= temp[-1]:
                    temp.append(v)
                    backtrack(temp, start + 1)
                    temp.pop()

        backtrack([], 0)
        return self.count

    def countVowelStrings_math(self, n: int) -> int:
        return (n + 1) * (n + 2) * (n + 3) * (n + 4) // 24
