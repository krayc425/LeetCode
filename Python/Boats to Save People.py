from typing import List


class Solution:
    def numRescueBoats(self, people: List[int], limit: int) -> int:
        people.sort()
        l, r = 0, len(people) - 1
        res = 0
        while l <= r:
            res += 1
            if people[l] + people[r] <= limit:
                l += 1
            r -= 1
        return res
