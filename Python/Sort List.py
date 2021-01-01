# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def getMid(self, node: ListNode) -> ListNode:
        midPrev = None
        while node and node.next:
            midPrev = node if midPrev is None else midPrev.next
            node = node.next.next
        mid = midPrev.next
        midPrev.next = None
        return mid

    def merge(self, left: ListNode, right: ListNode) -> ListNode:
        head = ListNode()
        curr = head
        left_curr = left
        right_curr = right
        while left_curr and right_curr:
            if left_curr.val < right_curr.val:
                curr.next = left_curr
                left_curr = left_curr.next
                curr = curr.next
            else:
                curr.next = right_curr
                right_curr = right_curr.next
                curr = curr.next
        curr.next = left_curr if left_curr else right_curr
        return head.next

    def sortList(self, head: ListNode) -> ListNode:
        if head is None or head.next is None:
            return head
        mid = self.getMid(head)
        left = self.sortList(head)
        right = self.sortList(mid)
        return self.merge(left, right)
