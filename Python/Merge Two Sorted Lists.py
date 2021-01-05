# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode()
        curr = head
        curr_l1 = l1
        curr_l2 = l2
        while curr_l1 and curr_l2:
            if curr_l1.val < curr_l2.val:
                curr.next = ListNode(curr_l1.val)
                curr_l1 = curr_l1.next
            else:
                curr.next = ListNode(curr_l2.val)
                curr_l2 = curr_l2.next
            curr = curr.next
        if curr_l1:
            curr.next = curr_l1
        if curr_l2:
            curr.next = curr_l2
        return head.next
