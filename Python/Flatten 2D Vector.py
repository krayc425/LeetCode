from typing import List


class Vector2D:

    def __init__(self, v: List[List[int]]):
        self.v = v
        self.outer = 0
        self.inner = 0

    def next(self) -> int:
        self.advance_to_next()
        val = self.v[self.outer][self.inner]
        self.inner += 1
        return val

    def hasNext(self) -> bool:
        self.advance_to_next()
        return self.outer < len(self.v)

    def advance_to_next(self):
        while self.outer < len(self.v) and self.inner == len(self.v[self.outer]):
            self.outer += 1
            self.inner = 0

# Your Vector2D object will be instantiated and called as such:
# obj = Vector2D(v)
# param_1 = obj.next()
# param_2 = obj.hasNext()
