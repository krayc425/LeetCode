from typing import List
from collections import deque


class FirstUnique:

    def __init__(self, nums: List[int]):
        self.q = deque()
        self.unique_map = {}
        for n in nums:
            self.add(n)

    def showFirstUnique(self) -> int:
        while len(self.q) > 0:
            if self.unique_map[self.q[0]]:
                return self.q[0]
            else:
                self.q.popleft()
        return -1

    def add(self, value: int) -> None:
        if value not in self.unique_map:
            self.unique_map[value] = True
            self.q.append(value)
        else:
            self.unique_map[value] = False

# Your FirstUnique object will be instantiated and called as such:
# obj = FirstUnique(nums)
# param_1 = obj.showFirstUnique()
# obj.add(value)
