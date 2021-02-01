from typing import List
from collections import defaultdict, deque


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def verticalOrder(self, root: TreeNode) -> List[List[int]]:
        nodes = defaultdict(list)
        q = deque([(root, 0)])
        while len(q) > 0:
            node, col = q.popleft()
            if not node:
                continue
            nodes[col].append(node.val)
            q.append((node.left, col - 1))
            q.append((node.right, col + 1))

        return [nodes[x] for x in sorted(nodes.keys())]
