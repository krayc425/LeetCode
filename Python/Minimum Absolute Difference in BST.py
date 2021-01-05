# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def getMinimumDifference(self, root: TreeNode) -> int:
        vals = []

        def inorder(node: TreeNode):
            if not node:
                return
            inorder(node.left)
            vals.append(node.val)
            inorder(node.right)

        inorder(root)
        min_diff = float('inf')
        for i in range(1, len(vals)):
            min_diff = min(min_diff, vals[i] - vals[i - 1])
        return min_diff
