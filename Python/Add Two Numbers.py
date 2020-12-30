# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode()
        curr = head
        carry = 0
        l1_curr = l1
        l2_curr = l2
        while l1_curr is not None and l2_curr is not None:
            next_val = l1_curr.val + l2_curr.val + carry
            if next_val >= 10:
                next_val = next_val - 10
                carry = 1
            else:
                carry = 0
            curr.next = ListNode(next_val)
            curr = curr.next
            l1_curr = l1_curr.next
            l2_curr = l2_curr.next
        while l1_curr is not None:
            next_val = l1_curr.val + carry
            if next_val >= 10:
                next_val = next_val - 10
                carry = 1
            else:
                carry = 0
            curr.next = ListNode(next_val)
            curr = curr.next
            l1_curr = l1_curr.next
        while l2_curr is not None:
            next_val = l2_curr.val + carry
            if next_val >= 10:
                next_val = next_val - 10
                carry = 1
            else:
                carry = 0
            curr.next = ListNode(next_val)
            curr = curr.next
            l2_curr = l2_curr.next
        if carry == 1:
            curr.next = ListNode(1)
        return head.next
