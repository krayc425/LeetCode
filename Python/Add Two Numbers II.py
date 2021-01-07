# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        stack1, stack2 = [], []
        curr1, curr2 = l1, l2
        while curr1:
            stack1.append(curr1.val)
            curr1 = curr1.next
        while curr2:
            stack2.append(curr2.val)
            curr2 = curr2.next
        n1, n2 = len(stack1), len(stack2)
        max_len, min_len = max(n1, n2), min(n1, n2)
        res = ListNode()
        head = res
        carry = 0
        for i in range(min_len):
            val = stack1[-1 - i] + stack2[-1 - i] + carry
            if val >= 10:
                val -= 10
                carry = 1
            else:
                carry = 0
            res.next = ListNode(val)
            res = res.next
        remained = stack1 if n1 > n2 else stack2
        for i in range(max_len - min_len):
            val = remained[-1 - i - min_len] + carry
            if val >= 10:
                val -= 10
                carry = 1
            else:
                carry = 0
            res.next = ListNode(val)
            res = res.next
        if carry == 1:
            res.next = ListNode(1)
        prev, curr = None, head.next
        while curr:
            next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        return prev
