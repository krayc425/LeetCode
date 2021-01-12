# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def reverseKGroup(self, head: ListNode, k: int) -> ListNode:
        if not head or k == 0:
            return head
        stack = []
        curr = head
        dummy = ListNode()
        new_curr = dummy
        while curr:
            if len(stack) < k:
                stack.append(curr.val)
                curr = curr.next
                if len(stack) == k:
                    while len(stack) > 0:
                        new_curr.next = ListNode(stack.pop())
                        new_curr = new_curr.next
        for i in range(len(stack)):
            new_curr.next = ListNode(stack[i])
            new_curr = new_curr.next
        return dummy.next

    def reverseHelper(self, head, k, leftNodes):
        if leftNodes < k:
            return head
        count = 0
        prev, curr = None, head
        while curr and count < k:
            count += 1
            leftNodes -= 1
            next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        if next:
            head.next = self.reverseHelper(next, k, leftNodes)
        return prev

    def reverseKGroup_recursive(self, head: ListNode, k: int) -> ListNode:
        count = 0
        node = head
        while node:
            count += 1
            node = node.next
        return self.reverseHelper(head, k, count)
