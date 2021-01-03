# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def removeNthFromEnd(self, head: ListNode, n: int) -> ListNode:
        dummy = ListNode(next=head)
        prev, slow, fast = None, dummy, dummy
        while n > 0:
            fast = fast.next
            n -= 1
        while fast:
            prev = slow
            slow = slow.next
            fast = fast.next
        prev.next = slow.next
        return dummy.next
