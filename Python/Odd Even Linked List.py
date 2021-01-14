# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def oddEvenList(self, head: ListNode) -> ListNode:
        odd_head = ListNode()
        even_head = ListNode()
        is_odd = True
        curr = head
        odd_curr = odd_head
        even_curr = even_head
        while curr:
            if is_odd:
                odd_curr.next = curr
                odd_curr = odd_curr.next
            else:
                even_curr.next = curr
                even_curr = even_curr.next
            is_odd = not is_odd
            curr = curr.next
        even_curr.next = None
        odd_curr.next = even_head.next
        return odd_head.next
