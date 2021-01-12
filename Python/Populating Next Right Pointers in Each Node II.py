# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next


class Solution:
    def connect(self, root: 'Node') -> 'Node':
        if not root:
            return None
        q = [root]
        while len(q) > 0:
            n = len(q)
            for i in range(n):
                if i > 0:
                    q[i - 1].next = q[i]
                if q[i].left:
                    q.append(q[i].left)
                if q[i].right:
                    q.append(q[i].right)
            q = q[n:]
        return root
