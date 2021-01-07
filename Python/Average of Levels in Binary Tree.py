from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def averageOfLevels(self, root: TreeNode) -> List[float]:
        res = []
        if not root:
            return res
        queue = [root]
        while len(queue) > 0:
            sum = 0.0
            n = len(queue)
            for i in range(n):
                node = queue[i]
                sum += node.val
                if node.left is not None:
                    queue.append(node.left)
                if node.right is not None:
                    queue.append(node.right)
            queue = queue[n:]
            res.append(sum / n)
        return res
