from typing import List


class ZigzagIterator:
    v1_loc = 0
    v2_loc = 0
    v1 = []
    v2 = []
    curr_v = 0

    def __init__(self, v1: List[int], v2: List[int]):
        self.v1_loc = 0
        self.v2_loc = 0
        self.v1 = v1
        self.v2 = v2
        self.curr_v = 0 if len(v1) != 0 else 1

    def next(self) -> int:
        if self.curr_v == 0:
            res = self.v1[self.v1_loc]
            self.v1_loc += 1
            if self.v2_loc != len(self.v2):
                self.curr_v = 1
        else:
            res = self.v2[self.v2_loc]
            self.v2_loc += 1
            if self.v1_loc != len(self.v1):
                self.curr_v = 0
        return res

    def hasNext(self) -> bool:
        return self.v1_loc != len(self.v1) or self.v2_loc != len(self.v2)

# Your ZigzagIterator object will be instantiated and called as such:
# i, v = ZigzagIterator(v1, v2), []
# while i.hasNext(): v.append(i.next())
