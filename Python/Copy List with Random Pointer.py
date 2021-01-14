# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random


class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        def clone_node(node: 'Node') -> 'Node':
            if not node:
                return None
            new_node = Node(node.val)
            new_node.next = clone_node(node.next)
            return new_node

        root = clone_node(head)
        old_arr = []
        new_arr = []
        old_head = head
        new_head = root
        while old_head:
            old_arr.append(old_head)
            new_arr.append(new_head)
            old_head = old_head.next
            new_head = new_head.next
        old_head = head
        new_head = root
        while old_head:
            if old_head.random in old_arr:
                i = old_arr.index(old_head.random)
                new_head.random = new_arr[i]
            else:
                new_head.random = None
            old_head = old_head.next
            new_head = new_head.next
        return root
