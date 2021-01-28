from typing import List
import heapq


# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def mergeKLists(self, lists: List[ListNode]) -> ListNode:
        head = ListNode()
        curr = head
        q = []
        for idx, l in enumerate(lists):
            if l:
                heapq.heappush(q, (l.val, idx))
                lists[idx] = l.next
        while len(q) > 0:
            val, idx = heapq.heappop(q)
            curr.next = ListNode(val)
            curr = curr.next
            if lists[idx]:
                heapq.heappush(q, (lists[idx].val, idx))
                lists[idx] = lists[idx].next
        return head.next
