# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def maxPathSum(self, root: TreeNode) -> int:
        self.res = float('-inf')

        def maxGain(node: TreeNode) -> int:
            if not node:
                return 0
            left = max(maxGain(node.left), 0)
            right = max(maxGain(node.right), 0)
            self.res = max(self.res, left + right + node.val)
            return node.val + max(left, right)

        maxGain(root)
        return self.res
