# The knows API is already defined for you.
# return a bool, whether a knows b
def knows(a: int, b: int) -> bool:
    pass


class Solution:
    def isCelebrity(self, i, n):
        for j in range(n):
            if i == j:
                continue
            if knows(i, j) or not knows(j, i):
                return False
        return True

    def findCelebrity(self, n: int) -> int:
        candidate = 0
        for i in range(n):
            if knows(candidate, i):
                candidate = i
        return candidate if self.isCelebrity(candidate, n) else -1
