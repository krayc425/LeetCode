from typing import List
from collections import defaultdict, deque


class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        map = defaultdict(list)
        for ticket in sorted(tickets, reverse=True):
            map[ticket[0]].append(ticket[1])
        res = []

        def visit(stop):
            while map[stop]:
                visit(map[stop].pop())
            res.append(stop)

        visit("JFK")
        return res[::-1]
