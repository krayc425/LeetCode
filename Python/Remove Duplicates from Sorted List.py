# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def deleteDuplicates(self, head: ListNode) -> ListNode:
        if not head:
            return None
        curr, next = head, head.next
        while next:
            if curr.val == next.val:
                curr.next = next.next
            else:
                curr = curr.next
            next = next.next
        return head
